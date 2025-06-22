# Double Row Keyboards!
A term I completely made up.

But a startegy that works really well if you want to make large keyboards with lots of functions but dont want to use an io expander.
My name is Taran and I am here to teach you about a cool technique that even I don't even know how I thought up of.

## Wtf am I talking about?
So say you have a 80% keyboard with 2 encoders, an oled, and RGB. That would normally take up 23(17x6) + 4(2 per encoder) + 2(oled) + 1(RGB)

That totals to 30 pins.

Lets take a look at the raspberry pi pico.

![pico](/app/assets/images/pico-pinout.svg)

Wait a minute, the Pico only has 26 General Purpose Input Output(GPIO) pins!

*Greiving princess voice* Oh whatever could I do, I want to put all this in my keyboard but the pico doesnt give me enough pins to do it. Oh in what way could I possibly include all these, without going through the pain of an io expander.

Wait a minute

Look at how much pins the matrix takes up.

Is there any way to possibly reduce how many pins it takes?

Lets go back to maths basics(holy crap, maths being used in real life)

We are doing 2d shapes and you have a quadrilateral with a set area of lets say 64(how many switches we want).

What is the shape we can make that keeps this area but reduces the perimeter to a minimum(our pins)?

Thats right, an 8x8 square.

But a keyboard is nowhere near a square. if we go to our previous example we had a 17x6 matrix. How on earth do we turn this into a square while keeping the routing clean?

Well thats what this guide is for!

Before we get into this, no I do not know what drugs I was on when I thought of this and no I do not want to google if it already exists because I am delulu and want to convince myself that I invented it.

## The Beginning
First of all, you are not trying to make a perfect square, you are trying to get as close to a square as possible. This method I am about to show you only works with larger boards. if you have a board thats too small, then you probably dont need this guide.

First let me show you this 16x4 matrix(pretend its an actual schematic, im not bothered to show yall how to do it in kicad)

![amongus](/app/assets/images/drm.png)

Then we take every other column and move it down

![koji](/app/assets/images/drm1.png)

now squish it into a cube

![anicetus](/app/assets/images/drm2.png)

hey look its a cube now. Lets draw our rows and columns

![funny](/app/assets/images/drm3.png)

Okay so i made the bottom 4 rows a diff colour because now we are going to go into the slightly more confusing part and having a diff colour should hopefully make it a bit easier for you to visualise this

Okay so now we are going to split our columns back up to how they were before, but make sure the columns all stay connected

![/darren](/app/assets/images/drm4.png)

Now push the columns back up. Dont worry if you can't learn this. My head hurts too from looking at it

![/darren](/app/assets/images/drm5.png)

Boom. Every other physical column uses the second set of rows so it can be put on the same matrix column.

We now just saved 4 pins for us to use on other things(16+4=20, 8+8=16. 20-16=4)

Now just use this newfound headache into your own keyboard and be amazed in how much you can stuff onto one pico.

Random Pointers

 - You dont need a switch on every matrix point. you can leave it blank and set it as XXXXXXX in the firmware to nullify it.
 - Have your schematic matrix set up roughly the same way as your keyboard layout so same positions and everything. doesnt have to be accurate but have it close since that makes it easier find the optimal matrix and easier for firmware
 - Those blank space can be extended out to any extra keys you might have(arrows, encoder switches, etc) so you dont need to use extra pins on a separate column
 - You dont need to be a perfect square, just get close to a square
 - do the math on whether it is worth doing this beforehand, you dont want to do this just to find out its pointless. Half the number of columns, double the rows, compare the pin amounts. always round up.

## Firmware
But taran, if I do this, wouldnt the firmware be super hard to code???????

Yes and no. It will be more difficult thank just a normal layout but that doesn't mean its really difficult. as long as you used the above pointers and have your schematic open in split screen while you make the firmware to cross reference the keymap, you should be fine.

If you want an example of a keyboard that uses this, look [here](https://github.com/Overlord-Runt/runtboard)

I hope I did not cause too much brain damage. Try your best to apply this into your own keyboards, I really hope to see what kind of cool things you all can build.

Happy building!
