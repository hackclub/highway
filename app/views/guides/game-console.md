# Game console

#### Tier 2 project (6 points)

Written by: alexren

Welcome! This is a quick writeup on how I made my very own retro game console from scratch.

This is going to be a more informal document, meant to give you an idea of how everything sort of fits together & some advice I found along the way. It's not going to be comprehensive and step-by-step like hackpad

## Overview

This is a game console that uses the following:

- Retropie firmware for emulation
- GPIONext for input
- Raspberry Pi Zero 2W
- MAX98357A module
- ILI9341 320x240 display
- 8ohm 2W speaker
- 6mm tactile pushbuttons
- A 3D printed case

It's heavily based on the [Pi-Tin Project](https://github.com/jackw01/pi-tin/) by Alley Cat engineering, but dramatically simplifies the process.

^^ pic of how it looks right now!

For how to design the project, it generally goes:

## 1. Overall design

First things first - overall what did I want this thing to look like? How complicated did I want it to be?

Initially, I wanted to inclued the whole 9 yards - potentiometer for volume control, integrated USB hub, battery management, everything.

Realizing the project actually had to launch though, I settled on a barebones design that was essentially a modernized clone of the gameboy advance, with the triggers moved to the D-pad on the right instead. Much more manageable.

Ultimately, this meant I needed the following features/had the following design constraints:

- 10 buttons, Up/Down/Left/Right, Start/Select, A/B/X/Y
- Small enough to hold in hand
- I/O must be exposed so that it can be plugged into a power supply to actually play.

I opted not to deal with any battery stuff to cut down on costs & give it more of a retro feel
 
## 2. Electronic components

The next step was to pick out the electronic components - this actually was not easy! First, I needed to figure out what featured I needed:

- It had to actually run (needed an SBC like an rpi)
- It had to play audio (needed an audio amp)
- Needed some inputs (buttons)??
- Needed *some* sort of screen (LCD?? OLED??)

Will write more but the tl;dr is:

- Picked an RPi Zero 2W cause I had it on-hand
- Picked a MAX98375A module because theyre readily available and are well documented
- Picked 6mm buttons cause they're small & readily available
- Picked an ILI9341 because the lower resolution of the ST7735 was way too small to play anything past NES games

## 3. Firmware & software setup

Once you have the components figured out, you have to figure out how to get the software all set up!

Turns out, this was an absolutely *terrible* process to go through because there wasn't much documentation, particularly with how to get the pi to use the TFT display as the primary display

I initially tried this with an ST7735R display instead of the ILI9341, but the same instructions applied.

The tl;dr is to use the adafruit pitft install script and then change around the dtoverlay it's referencing.

## 4. Case design & physical layout

You should start with this *before* making the PCB - it's the main constraint here and the PCB can really be made as big or as small as you want.

In general, when picking passives (buttons, levers, etc), pick them last. You'll have to do a bunch of iteration back and forth between everything, and the physical layout is probably going to matter more.

When making my case, I started with the front first, since that way I can lay out the rest of the components.

The next part was figuring out how to sandwich all the pieces together.

(TO BE CONTINUED)

## 5. PCB

This is where it got interesting. For the PCB, I wanted the constraint of having the parts be easily hotswappable, since that way I could easily remove parts if needed. I also just prefer my designs to not require permanent modifications to components.

Initially, my plan was to have a single PCB for everything, similar to how sprig does it. The problem is that the buttons end up being REALLY far from the front plate because of how tall the screen is, so it'd feel really awkward.

[Adafruit's PiGRRL](https://github.com/adafruit/Adafruit-PiGRRL-PCB) project actually handled this rather elegantly by making 2 identical PCBs separately for the buttons - I opted to go with this strat because that way I could decouple the rpi carrier board from the gamepad buttons.

Ultimately, I landed with 3 different PCBs, the two sides being identical:

(picture here)



## 6. Final assembly

With all the PCBs, I just had to drop them in fusion & mount them to the case

(WIP)

