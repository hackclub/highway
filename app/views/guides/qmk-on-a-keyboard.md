# QMK on a Keyboard!

Written by nimit vijayvargee.

## Prerequisites:

 - Have some basic understanding of keyboard firmware
 - Prior experience with code editors and understanding of javascript object notation (.json)
 - A schematic/PCB of a keyboard/macropad you wish to program QMK for

## Step 1 - Setting up your environment
In order to start, you need a copy of the QMK Repository and the QMK-MSYS CLI to compile firmware. You can download QMK-MSYS from [here](https://msys.qmk.fm/). Running `qmk setup` in MSYS will automatically download and setup all repositories. You may need to enter some details such as your name and answer some yes/no questions. Once MSYS is setup, try to compile any keyboard. The command to compile is `qmk compile -kb <keyboard> -km <keymap>`. If it succeeds, you can proceed with making your own keyboard! If it fails, you may need to troubleshoot the error or perform a clean install. You can use `qmk doctor` to perform a diagnostic which you can share in the official [QMK Discord server](https://discord.gg/qmk) to seek help.
If you are not on windows, you may need to download qmk using brew (macOS) or pip (Linux). Detailed information is available on the MSYS website.

## Step 2 - Creating a new keyboard
Now that QMK-MSYS is working, you can create your own custom keyboard! Start by creating a new keyboard by using `qmk new-keyboard`. Enter some basic details like your keyboard name, keyboard layout and your mainboard.
![qmk new keyboard attribution](app/assets/images/new-keyboard-attribution.png)
```
Default Layout?
	...
	17. 68_iso
	18. 75_ansi
	19. 75_iso
	...
Please enter your choice: [65] 18
```
```
Using a Development Board? [y/n] n
Ψ Select Microcontroller
Ψ For more information, see:
https://docs.qmk.fm/compatible_microcontrollers
Microcontroller?
	...
	20. MKL26Z64
	21. RP2040
	22. STM32F042
	...
Please enter your choice: [13] 21
```
\
The Raspberry Pi Pico is not considered a development board, so use the RP2040 instead!\
Now go to the directory that is pasted into the console! There, you will see your new keyboard as a folder!\
![keyboards-directory](app/assets/images/keyboards-directory.png)

## Step 3 - Configuring the keyboard
Now that our keyboard has all the necessary files, let's first understand what all the files do. \
```
keyboardv2_guide
    ├── keyboard.json
    ├── keymaps
    │   └── default
    │       └── keymap.c
    └── readme.md
```
Within our keyboard folder, we find our `keyboard.json` file, our readme and a keymaps folder where we can configure various keymaps. Do note that once a keymap is changed, the firmware must be recompiled.

The `keyboard.json` file requires us to configure the features and the core parts of our keyboard. This includes the pinouts, the matrix, the bootloader and also the microcontroller. In this case, we are making an RP2040 based keyboard.
```
"manufacturer": "nimit vijayvargee",
"keyboard_name": "keyboardv2-guide",
"maintainer": "nimit vijayvargee",
"bootloader": "rp2040",
"diode_direction": "ROW2COL",
```
This part is usually default from when the keyboard is built. If your diode direction is incorrect, you may change it here. *Changing the keyboard name in this step might not compile properly, so use the CLI instead.*
```
"USB":{
    "device_version": "2.0.0",
    "pid": "0x0000",
    "vid": "0xFEED"
},
```
The USB part tells the host computer the device's vendor and product IDs. Unless you have a specific reason, it is best to follow the default QMK IDs or the ID's from your microcontroller manufacturer (eg. [Raspberry Pi](https://github.com/raspberrypi/usb-pid)).
```
"features": {
    "bootmagic": true,
    "command": false,
    "console": false,
    "extrakey": true,
    "mousekey": true,
    "nkro": true,
    ...
},
```
The features allow you to define any hardware and software features. The list of available features is on the QMK documentation, but in this example we will only use a rotary encoder.

```
"matrix_pins": {
    "cols": ["GP7", "GP8", "GP9", "GP10", "GP11", "GP12", "GP13", "GP14","GP15", "GP16", "GP17", "GP18", "GP19", "GP20", "GP21", "GP22"],
    "rows": ["GP0", "GP1", "GP2", "GP3", "GP4", "GP5"]
    },
```
Here, you must define your pins for each matrix row and column. If you're using direct key, you must specify that differently. In this guide, I am assuming that your keyboard/macropad is in a matrix to save pins.
These matrix pins should be taken straight from your schematic or PCB.

```
"layouts": {
    "LAYOUT_75_ansi": {
        "layout": [
            {"matrix": [0,0], "x":0, "y":0}, -> Esc
            {"matrix": [0,2], "x":2, "y":0}, -> F1
            {"matrix": [0,3], "x":3, "y":0}, -> F2
            {"matrix": [0,4], "x":4, "y":0}, -> F3
            {"matrix": [0,5], "x":5, "y":0}, -> F4
            {"matrix": [0,6], "x":6.5, "y":0}, -> F5
            {"matrix": [0,7], "x":7.5, "y":0}, -> F6
            {"matrix": [0,8], "x":8.5, "y":0}, -> F7
            {"matrix": [0,9], "x":9.5, "y":0}, -> F8
            {"matrix": [0,11], "x":11, "y":0}, -> F9
            {"matrix": [0,12], "x":12, "y":0}, -> F10
            {"matrix": [0,13], "x":13, "y":0}, -> F11
            {"matrix": [....], "x":.., "y":.}, -> ...
            ]
        }
}
```
The layout follows a simple pattern as shown. *Order of the defined keys matters when creating a keymap.* The matrix field corresponds to the row and column. The numbering starts from 0 so the last number should be `[rows-1,cols-1]`. The x and y fields correspond to the physical position of the keyswitch (similar to Keyboard Layout Editor). You may also add a "w" field for the width of each key. Fill out each key into your layout. Here, you should be done configuring `keyboard.json`.

After this, we must edit the `keymaps/default/keymap.c` file. In this file, we define the keymap for our keyboard. *Follow the same order as the layout list.* This is unique to your keyboard, so while the original keymap may work, you should edit it according to your layout.
```
#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {

    [0] = LAYOUT_75_ansi(
        KC_ESC, KC_F1, KC_F2, KC_F3, KC_F4, KC_F5, KC_F6, KC_F7, KC_F8, KC_F9, KC_F10, KC_F11, KC_F12, KC_MPLY,
        KC_GRV, KC_1, KC_2, KC_3, KC_4, KC_5, KC_6, KC_7, KC_8, KC_9, KC_0, KC_MINS, KC_EQL, KC_BSPC, KC_DEL,
        KC_TAB, KC_Q, KC_W, KC_E, KC_R, KC_T, KC_Y, KC_U, KC_I, KC_O, KC_P, KC_LBRC, KC_RBRC, KC_BSLS, KC_PGUP,
        KC_CAPS, KC_A, KC_S, KC_D, KC_F, KC_G, KC_H, KC_J, KC_K, KC_L, KC_SCLN, KC_QUOT, KC_ENT, KC_PGDN,
        KC_LSFT, KC_Z, KC_X, KC_C, KC_V, KC_B, KC_N, KC_M, KC_COMM, KC_DOT, KC_SLSH, KC_RSFT, KC_END,
        KC_LCTL, KC_LGUI, KC_LALT, KC_SPC, KC_RALT, KC_RCTL, KC_LEFT, KC_DOWN, KC_RIGHT, KC_UP
    ),

};
```
If your `keyboard.json` and `keymap.c` files are complete, you can move on to the first test compile!

## Step 4 - Compiling
Once you are ready to compile, open up QMK-MSYS again. Here, run the following command. \
`qmk compile -kb {keyboard_name} -km {keymap_name}` \
In my case, I should run
`qmk compile -kb keyboardv2 -km default`
If there are any errors, fix them as instructed. If an error is difficult to troubleshoot, drop it in the Hackclub Slack or the QMK Discord Server along with your config files, and someone will be ready to help!
Once compilation is complete, the binary file (.bin, .hex or .uf2) will be generated into the QMK Root folder.

## Step 5 - Flashing (RP2040)
For an RP2040 board, flashing can be done by holding the BOOTSEL button while plugging the pico into a USB port. This will open up a drive labelled RPI-RP2. You can paste your .uf2 into this drive to complete the flashing process, and the microcontroller will reboot into QMK.

## Step 6 - Testing
Now that your keyboard is flashed, you can test your keyboard by visiting any keyboard testing site and pressing each button (or mashing them if that's your thing).  If any rows or columns are not detected, check your configuration pins. If any switches output the wrong key, check your keymap. If an individual switch is not functioning, check your matrix layout. If QMK is configured properly, you might have an issue with the hardware, in which case you should check your solder joints and make sure that the diodes directions are all match.

## Bonus - Rotary encoders!
Rotary encoders are quite fun, they can be used for media input or volume control or even as a fun fidget thing!

- Step 1 - `info.json`:
    Create `info.json` file in your keyboard's root directory. 
    The `info.json` file can be used for defining basic features without having to write code. This is practical if you don't intend to change the complete working of some features.
    ```
    keyboardv2_guide
        ├── info.json
        ├── keyboard.json
        ├── keymaps
        │   └── default
        │       └── keymap.c
        └── readme.md
    ```
    Copy the data from `keyboard.json` into the new file. Next, add `"encoder":true` into your features:
    ```
    "features": {
        "encoder": true,
        ...
    }
    ```
    You should also enable the encoder map, allowing you to change what the encoder does on each layer, giving your encoder more power when paired with other keys like function or alt.
    Just add the following line to your `rules.mk` file:
    `ENCODER_MAP_ENABLE = yes`

    Lastly, add the encoder object to your json.
    ```
    "encoder": {
        "enabled": true,
        "rotary": [
            {
                "pin_a": "GP26",
                "pin_b": "GP27",
                "resolution": 4
            }
        ]
    },
    ```
    The pins can be replaced with whatever pins you are using for your encoder. The switch part of a push-button encoder can be connected as a keyswitch in your regular keyboard matrix.
    In short, the resolution field is used to change how much you need to turn the encoder to register an input. This can be changed if your encoder is too sensitive or requires too much turning. By default, it is set to 4.

- Step 2 - Adding it to your keymap:
    The encoder can be simply added to your keymap by using these lines:
    ```
    #if defined(ENCODER_MAP_ENABLE)
    const uint16_t PROGMEM encoder_map[][NUM_ENCODERS][2] = {
        [0] = { ENCODER_CCW_CW(KC_xx, KC_xx), ...  },
    };  
    #endif
    ```
    Change the keycodes and **make sure to have the same number of layers in your encoder map as layers in your main keymap**. If you have more than one encoder, change the number of encoders and make sure to repeat `ENCODER_CCW_CW(KC_xx, KC_xx)` for each encoder you have within that layer. 

- Now you can compile again with your spinny encoders working!

