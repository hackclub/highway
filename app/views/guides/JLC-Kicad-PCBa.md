# How to prepare your BOM and CPL files for JLC PCBa

Lah Dee Dah Dee Dah\
I love making PCBs\
But i cant SMD solder for the life of me so just use PCBa though.

Hey whats kicad? oh a super cool pcb software thats a million times better than easyeda!?!?!?!?!\
Why havent i found this sooner??????

Time to make a super cool pcb.\
Okay done the pcb.\
Time to buy it on jlc with that pcba.

HUH?\
![sdfs](https://hc-cdn.hel1.your-objectstorage.com/s/v3/ac9e21c498b06f653f00d21e1f669a267a4b821d_screen_shot_2025-07-26_at_3.43.39_pm.png)\
What the hail is this. why does my cpl not work?????

Well im here to help you fix that by showing you how to fix the BOMs and CPLs that kicad gives you.

## BOM

First we are gonna change the BOM because thats easier and should help you practice what you need to do for the CPL which is a bit harder but still really easy.

First you wanna take the BOM file that kicad gives you and import it to google sheets. You can use any spreadsheet editor to do it or any text editor if you hate yourself. I am going to use google docs for this guide though

![fdfsfkf](https://hc-cdn.hel1.your-objectstorage.com/s/v3/6af6de6e34755fa9a41072f213eee2beed23728e_screen_shot_2025-07-26_at_5.08.58_pm.png)

It should look like this once you upload it.

JLC Requires you to have the headings Comment, Designator, Footprint, and LCSC Part Number in that order. everything else can be deleted/disregarded.

Of course the Kicad output doesnt give you an LCSC part number column so you need to add that yourself.

So to convert our file, you change the "Value" column to Comment and drag it to the front

Designator stays the same. Delete all the columns after footprint and the Quantity column. 

Drag the Footprint column to the 3rd position.

Your new file should look like this VVVV

![dsf](https://hc-cdn.hel1.your-objectstorage.com/s/v3/fa888eb8c2d308ec7713a4263bca58385cf905d6_screen_shot_2025-07-26_at_5.45.18_pm.png)

you can add 'LCSC Part Number' to the last column if you want but thats optional since jlc will let you do that on the order page.

After that you go file>download>comma separated values(.csv)

That is your BOM done

## Placement File

Your CPL is next. You are basically doing the same thing but just a few more steps.

so for the CPL, JLC requires the following headers in order: Designator, Val, Package, Mid X, Mid Y, Rotation, Layer.

After importing your kicad cpl to google drive, it should look like this V\
![sd](https://hc-cdn.hel1.your-objectstorage.com/s/v3/b8cc24181b8e8fc8d8fe4ab3c6c64c60019f016c_screen_shot_2025-07-26_at_5.56.34_pm.png)

here your footprint is the Package, value is the Val, pos_X is Mid X, pos_Y is Mid Y, side is Layer, and designator is Designator(idk if its caps sensitive but i would do it just in case.

Delete the rest of the columns

Once you do that you can order the columns. make it match this image VVVV

![sdf](https://hc-cdn.hel1.your-objectstorage.com/s/v3/879d166f44c8573a4e36331ca47cbfd3ca6c3d1e_screen_shot_2025-07-26_at_6.05.47_pm.png)

Now file>download>comma separated alues(.csv) and use those 2 files for your pcba

![dfsf](https://hc-cdn.hel1.your-objectstorage.com/s/v3/05b8eb475ccc96bc16e7baa4aec398b38f01b3ac_screen_shot_2025-07-26_at_6.08.33_pm.png)

It worked :D

if you had used the LCSC Part Number column in your bom and filled it out, it would autofill all the parts but if you didnt then you can search for the parts you used here.

---

Anyways thats the guide! Hope you learnt something new and maybe avoided some headaches.

If you see anything wrong with this, just make a pr to change it or dm me and I will fix it

Guide by @Taran The Idiot
