# Jukebox



Written by [danieliscrazy](https://github.com/danieliscrazy/Jukebox) (@dld on Slack)

_[Link to repo](https://github.com/danieliscrazy/Jukebox/)_

This is my Minecraft jukebox IRL project I made for Hack Club's Highway program! It uses a Raspberry Pi Zero 2 with an NFC shield to detect when discs are put in, and plays them out of the speaker in the back! I'm gonna go a bit more in depth about it here.

### Hardware
> I link to parts that I know are from reputable sources. Things I already have/don't remember where I got them from, I didn't link as I don't want to vouch for something I haven't purchased, and if you want to make this project you'll have to look for it yourself. Sorry!

The brains of this project is a [Raspberry Pi Zero 2 W](https://www.adafruit.com/product/5291). I was originally going to use a Pi 3 B+, as it has AUX output and the Zero 2 does not, but that ended up being too expensive for my grant, so I went with a Pi Zero 2 plus an [I2S amp](https://www.adafruit.com/product/3006) and a [3" speaker (4Ω 3W)](https://www.adafruit.com/product/1314). Requires a bit more configuring (see [here](https://learn.adafruit.com/adafruit-max98357-i2s-class-d-mono-amp/overview) for a tutorial), but works just fine. I used an RC522 board alongside a few 1" NFC tag stickers (NTAG215 tags, but it shouldn't matter really). I followed [this guide](https://pimylifeup.com/raspberry-pi-rfid-rc522/) by Pi My Life Up for the wiring and the Python setup. I used the script in their [GitHub README](https://github.com/pimylifeup/MFRC522-python/blob/master/README.md) as a test script.

![jukebox wiring](https://github.com/user-attachments/assets/20cb8b81-cf66-49eb-bd9f-e865b8565c4e)
> The wiring diagram for my project.

### Software

The [Python script I have](https://github.com/danieliscrazy/jukebox.py) is clunky, probably not efficient, and partially AI generated, but it gets the job done. For every song/disc/NFC tag, I just repeat the code. These are the songs themselves:

```

otherside = vlc.MediaPlayer("file:///home/danield/jukebox/otherside.mp3")
pigstep = vlc.MediaPlayer("file:///home/danield/jukebox/pigstep.mp3")
```

Each song has its own tag, and thus tag ID. To add a new disc, I just add an MP3 as shown above, add an `elif`, copy the code over, and replace the tag ID and the song. Simple when there's only 2 songs, but I plan to have 13 of them at least, so it'll get complicated fast. Like I said, clunky and inefficient, but it works!

```
try:
    while True:
        print("Hold a tag near the reader")
        id, text = reader.read_no_block()
        if id == 584186575628:
            if last_id != id:
                print("Detected! Playing!")
                otherside.play()
            last_id = id
            tries = 0
        elif id == 584196735387:
            if last_id != id:
                print("Detected! Playing!")
                pigstep.play()
            last_id = id
            tries = 0
```

It reads every .2 seconds to see if the disc is there. Then I have every song stop playing when the tags are removed. I also added some code to not immediately stop it unless it's been detected as gone 5 times, because it turns out the wall of the slot in the case is just barely too thick.

```
        else:
            if last_id is not None:
                tries += 1
                if tries >= 5:
                    print("No longer detected! Stopped!")
                    otherside.stop()
                    pigstep.stop()
                    last_id = None
                    tries = 0
        sleep(0.2)
```

Make sure you're in a venv (look at the Pi My Life Up guide above), and then install the packages:

```
pip3 install python-vlc mfrc522
```

I do feel the need to note that after completing this project, I found that [someone else already made a similar project](https://www.reddit.com/r/Minecraft/comments/12510sh/i_3dprinted_a_working_minecraft_jukebox_with_all/)! They used a software called [PhonieBox](https://phoniebox.de/index-en.html) which does basically all this does and more. I haven't tried it out so I can't vouch for it, but if you want to make this project, it might work better for you.

### Case

I made the case in TinkerCAD. While it isn't great for complex stuff, it _is_ great for simple geometric shapes, and you can't get more geometric than Minecraft blocks. Each pixel is an 8\*8\*8 mm cube, and each face is a millimeter lower than the frame and the pattern. 

![image](https://github.com/user-attachments/assets/8933d638-a7f1-47eb-bdf2-4f4c081aec3c)
> A face of the Jukebox broken down into pixels.

I ended up breaking it into 4 parts, the main body (4 of the 6 faces), the side panel (which has the hole for the speaker and for the Pi's power cable), the top panel (with the hole for the disc to go in), and the actual slot that holds the disc. The body and panels fit together in a sort of jigsaw way.

![image](https://github.com/user-attachments/assets/c2484dcc-140f-4df3-9322-a24319113c50)
> All 4 pieces of the case.

I printed them on my Ender 3 V2 with PrusaSlicer at 15% infill and 0.28 mm layer height (except for the main body, which I printed at 0.2 mm to make sure it was _exactly_ 128 mm, this is likely unneccesary). I printed the top panel flat on the bed, and I printed the side panel upright to make sure the texture of the pattern didn't look weird once it was all together. Despite Prusa insisting on it, supports are not needed for a 1 mm overhang, and if there were supports there, they'd be impossible to remove. Because of that, I unfortunately had to disable auto supports and manually paint them on in the places they were actually needed, which was a pain in the butt.

I printed out all the pieces before I realized that they didn't fit together right, and I hadn't included tolerances into the design. I added tolerances of 0.2 mm to the top panel, side panel, and slot, and it fit together properly with the original body piece. 

![image](https://github.com/user-attachments/assets/613a23d1-f3eb-434b-8734-2ab73c9b854e)
> The pre-paint jukebox!

After that I just had to paint it! I used acrylic paint, which was a pain because I'm not good at painting. Spray paint would've been better, but acrylic worked. 

![e6d2d8f9-c0e4-4e8b-b50d-6ad5c24ad641](https://github.com/user-attachments/assets/9e3cc6ab-5271-4328-9dc9-54f68ff21187)
> The finished product!

So yeah, that's how I made the jukebox!
