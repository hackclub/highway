# How to design your own footprint and symbol for KiCad!!
by @espcaa

Who never encountered the eternal component that didn't have a footprint or symbol in KiCad? That's why i'm trying to teach you how to design your owns today!
To do this, i'll use [this button](https://lcsc.com/product-detail/Pushbutton-Switches_HanElectricity-KFC585875-W_C22459507.html?s_z=n_KFC585875) as an example, but you can use any component you want!

## Step 1: Find the datasheet

If you don't have any footprint or symbol to refer to, the first step is to find the datasheet where you'll likely also find the measurements of the component. In this case, the datasheet can be easily found because this is LCSC and is even in english!!
See it [here](https://lcsc.com/datasheet/lcsc_datasheet_2410121553_HanElectricity-KFC585875-W_C22459507.pdf).

## Step 2: Create the symbol

To create the symbol, you can use the KiCad Symbol Editor. Open it like this: \
<img src="https://files.catbox.moe/hwi0si.png" width="400">

Then, create a new library where you'll store that custom symbol. You can do this by clicking on the "File" menu and selecting "New Library". \
<img src="https://files.catbox.moe/epe6d2.png" width="200">

Select project and continue \
<img src="https://files.catbox.moe/82rkvj.png" width="400">

Name it however you want and save it in the project folder

Now you're ready to start creating the symbol! Click on the "Create Symbol" button in the "File" menu or use the shortcut Ctrl+N. \
Then just change the name to whatever you want, in this case, "button" (please name yours better sob) and click "OK". (don't touch at the other values  it should be fine for now) \
<img src="https://files.catbox.moe/hjk0le.png" width="400">

Now go look at your datasheet and add the number of pins you need! (If you can, try to match the actual layout, but it doesn't matter.) \
(_Ps, the pin tool is here ->_) \
<img width="400" alt="Screenshot 2025-06-24 at 00 39 46" src="https://github.com/user-attachments/assets/93aa54e3-5d0c-45ca-9f31-d21c72622bf1" />
<img width="400" alt="Screenshot 2025-06-24 at 00 42 10" src="https://github.com/user-attachments/assets/dd84efce-97e5-47cc-bc75-57b4b1dd7e58" />

According to the datasheet, I need 6 pins in a 3x2 layout: \
<img width="400" alt="Screenshot 2025-06-24 at 00 45 58" src="https://github.com/user-attachments/assets/69584dec-4729-4114-80b6-3b2fb01beb47" />
<img width="400" alt="Screenshot 2025-06-24 at 00 45 25" src="https://github.com/user-attachments/assets/12b5019b-f678-4dc2-9344-5c32fcb67cae" />

After you've done this, you could just stop there but don't fear adding a rectangle as a background or even some text! \

<img width="400" alt="Screenshot 2025-06-24 at 00 47 03" src="https://github.com/user-attachments/assets/5cb10835-d1df-44f2-85b5-4444ee374891" />

Save your file with ctrl+s! (or cmd+s for the macos users) (tux+s??? okay imma stop there)

## Step 3 : Create the footprint!

Now let's open the footprint editor!! \
<img width="400" alt="Screenshot 2025-06-24 at 00 58 45" src="https://github.com/user-attachments/assets/b19295e5-d5dc-4c65-bcfe-58b9dcfe4d1b" /> \
Just repeat what you did in the symbol editor to make a new footprint! (the lib doesnt need to be named the same way, dw too much about it) \
_Note: because this is a component wich is mounted through holes (long poles on the component that go through the pcb), I'm going to select the Through Hole option when creating my footprint but if you have a SMD component, the process should be very similar (= just copper pads on the surface) \
<img width="400" alt="Screenshot 2025-06-24 at 01 00 46" src="https://github.com/user-attachments/assets/3079266e-2d46-4491-89ed-30acf3e39248" /> \

Now that you're in the footprint editor, you're going to do almost the same thing, creating new real pins this time! \
<img width="400" alt="Screenshot 2025-06-24 at 01 03 33" src="https://github.com/user-attachments/assets/d5209eb9-636d-4262-a527-15b021cf7045" /> \
Be careful because this time, this will really appear on your pcb as it is on your footprint! You need to make sure every dimension is corresponding to the datasheet! \
_ You can use the datasheet and the ruler tool!!_ \

<img width="400" alt="Screenshot 2025-06-24 at 01 04 27" src="https://github.com/user-attachments/assets/05d81c61-e59a-4795-9fe9-abc93d605df8" /> \
<img width="400" alt="Screenshot 2025-06-24 at 01 06 45" src="https://github.com/user-attachments/assets/30a38062-d15d-49a9-a0f7-06d1d881ef13" /> \
At the end you should have something like this: (Make sure the pins/pads numbers correspond to your datasheet EXACTLY!!!) \
<img width="400" alt="Screenshot 2025-06-24 at 01 09 06" src="https://github.com/user-attachments/assets/3db09d6a-80a2-4782-8ce1-881bee707158" /> \
Once everything is finished, just save with ctr+s (or... tux ...)

## Step 4 : Using all of this mess!!

Now that you sucessfully created all of your symbols/footprints you can go back to your schematic editor and add it like any other component just by typing its name! 

<img width="1083" alt="Screenshot 2025-06-24 at 01 12 10" src="https://github.com/user-attachments/assets/9d5da0eb-bba7-46ac-b5e0-7044a6989cb9" /> \
_Last note: don't forget to assign it a footprint by double clicking then changing the footprint field!_ \
On this, i'm going to sleep, I hope this helped someone and if you see any error, just dm me on slack!

Note from Cyao: Uh guys you need to make sure that every pin in the symbol has a pin number, and it matches the footprint pin numbers!!! The guide forgot pin numbers on the pin 2, 3 and 4.
