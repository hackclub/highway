# Vial on QMK
on QMK on a Keyboard!
Part 2 of QMK on a keyboard
Written by nimit vijayvargee.

## Prerequisites:

 - Have QMK Working on your keyboard
 - Basic understanding of keymaps and keycodes from QMK

## Vial
Vial is a GUI Based app to toggle features, change keycodes and layers, and mess with the lighting all on the fly! No more recompiling after changing one key!

## Step 1 - Setting up your environment
Since we already setup QMK-MSYS (or alternative CLI tool), this time we only need an up-to-date version of the Vial fork. Navigate to the directory and clone the repository:
`git clone https://github.com/vial-kb/vial-qmk.git`
Move your keyboard code from `qmk-firmware/keyboards` to `vial-qmk/keyboards` without changing anything. The Vial fork can still compile normally so you may delete the QMK fork. *(The keen eyed among you might have noticed I was working on the Vial fork in the previous tutorial :p)*

## Step 2 - Creating the Vial Keymap
Within your keyboard directory, create a new keymap named Vial. Create the following four files.
```
├── keyboardv2
│   ├── config.h
│   ├── info.json
│   ├── keyboard.json
│   ├── keymaps
│   │   ├── default
│   │   │   └── keymap.c
│   │   └── vial
│   │       ├── config.h
│   │       ├── keymap.c
│   │       ├── rules.mk
│   │       └── vial.json
│   ├── readme.md
│   └── rules.mk
```
The `config.h` stores some basic info about your keyboard (mainly the Vial UID).
The `keymap.c` can be an exact copy of your default keymap (This is the base keymap when you compile the firmware).
The `rules.mk` contains Vial-specific rules.
The `vial.json` is the main file that controls how your keyboard appears in the GUI.

## Step 3 - Keyboard Layout Editor
For Vial to accurately display your keyboard, you need to layout your keyboard using [KLE](https://www.keyboard-layout-editor.com/). Follow your actual keyboard or your PCB design and match it onto the website. On the Top Left legend of each key, add the matrix position (without brackets). 
![KLE](app/assets/images/guide-qmk/kle-vial.png)
For the rotary encoders, add the switch part as a regular keyswitch. For the encoder however, add a unique encoder ID (in this example, there is only one so the ID is 0) and a 0/1 based on direction. However, in here, add `e` as the center legend on each encoder direction. Vial will display them as circles in the GUI. Once done, copy the raw data and keep it somewhere temporarily.

## Step 4 - `vial.json`
Start with the following template:
```
{
    "lighting": "none",
    "matrix": {
        "rows": 0,
        "cols": 0
    },
    "layouts": {
        "keymap":
    }
}
```
In front of keymap, paste your raw KLE data, making sure to terminate any brackets in the end. Also make sure to fill the matrix row and col count accurately. Leave `"lighting"` as `"none"` as we will discuss RGB backlighting in a later guide.

## Step 5 - `config.h` and `rules.mk`
**`rules.mk` in this part of the guide refers to the part of the Vial keymap, not the one in the keyboard root.** 
First, you must put the following two lines in `rules.mk` to enable Vial.
```
VIA_ENABLE = yes
VIAL_ENABLE = yes
```
Also add `ENCODER_MAP_ENABLE = yes` if you are using an encoder.
**Putting `VIA_ENABLE = yes` IS NOT OPTIONAL**
Next, run the following command in the vial-qmk root.
`python3 util/vial_generate_keyboard_uid.py`
This command will generate a custom UID for your keyboard. Paste the generated UID into `config.h` as follows:
```
#pragma once
#define VIAL_KEYBOARD_UID {0xXX, 0xXX, 0xXX, 0xXX, 0xXX, 0xXX, 0xXX, 0xXX}
```
You must also set a custom unlock combination for your keyboard, so malicious hosts cannot access your keyboard data without human input.
Add the following in your `config.h`
```
    #define VIAL_UNLOCK_COMBO_ROWS { a, c, ..}
    #define VIAL_UNLOCK_COMBO_COLS { b, d, .. }
```
(a,b) is the matrix position of the first key.
(c,d) is the matrix position of the second key.

## Step 6 - Compiling and Flashing
The compiling and flashing process remains identical to QMK, with a minor change. When selecting the keymap, you MUST use the Vial keymap by using `.. -km vial` in your compile instructions. In my case, it would be as follows:
`qmk compile -kb keyboardv2 -km vial`
Flash the generated binary by using bootloader mode or QMK toolbox as per your microcontroller!
