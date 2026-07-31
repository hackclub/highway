# Circuitpython Displays
Written by nimit vijayvargee
So you made a cool project with a screen? Maybe an OLED, or an LCD! SPI or IIC? This guide goes over how to use the screen with Circuitpython!

## Prerequisites
 - Using Circuitpython for basic GPIO control
 - Basic understanding of IIC and/or SPI communication protocols
 - Connecting a screen to a microncontroller
 - Some understanding of hex codes, Bitmaps and palettes

## Background
Circuitpython is very well developed with an extension of hundreds of libraries. A few of the important ones in this project are the `displayio`, `busio` and `digitalio` libraries. Additionally, we will also be using the display specific libraries (like the `adafruit_ssd1306` and the `adafruit_st7735`) in this guide.
**Note: Circuitpython 9.0.0 above changed the way display libraries handled splashes and groups slightly. If you are using an older version, do note that `display.show(group)` was replaced with `display.root_group = group`. It is hightly recommended to switch to 9.x.x.**

## Step 0 - Setting up Circuitpython
Circuitpython can be downloaded for your specific board from [here](https://circuitpython.org/downloads). Circuitpython also needs a supported IDE to handle the REPL. While Visual Studio Code and a few others are supported, I personally suggest [Thonny](https://thonny.org/) because of how well it integrates all the features. \
Once Circuitpython is installed, it should be accessible from Thonny.

## Part A - SPI Screen (ST7735)
The ST7735 is a series of screens with a colour TFT-LCD. They are quite cheap, look good and are easy to work with over the SPI interface! Infact, they are the same screen used on the [Sprig](https://sprig.hackclub.com/). 

### Step 1 - Importing required libraries
The main libraries we need are `displayio`, `busio` and our display's driver library (in this case, `adafruit_st7735r`). `displayio` and `busio` are available on all the boards that support them, so we only need the driver library. The driver library can be found as a part of the Circuitpython library bundle. In this case, the ST7735R library comes in the form of a `.mpy` file (precompiled micropython). We should copy this library into our board's lib folder.

### Step 2 - Initializing the display
We need to initialize the display using the `displayio` library. The `displayio` library requires a display bus to communicate with the display. For SPI, we can use the `fourwire.FourWire` class to create a display bus. We also need to specify the pins used for the display, which are based on your connections or schematics. Here is the initialization process:

```py
from adafruit_st7735r import ST7735R
import displayio
import busio
from fourwire import FourWire
displayio.release_displays()  # clear any display from previous runs
display_bus = FourWire(
    bus=busio.SPI(clock=board.GPxx, MOSI=board.GPxx),
    command=board.GPxx,
    chip_select=board.GPxx,
    reset=board.GPxx
)
display = ST7735R(display_bus, width=128, height=160, rotation=xx)
```
Thus, our display is now initialized and ready to use! Make sure to replace `board.GPxx` with the actual GPIO pins you are using for the clock, MOSI, command, chip select, and reset, and the rotation based on your screen's orientation. Do note that rotation may only be 0, 90, 180 or 270 degrees. Width and Height should also be set based on your specific screen type, although most ST7735 screens are 128x160 pixels.

### Step 3 - Using the display
Next, let us set the whole display to a solid colour. We can do this by creating a `displayio.Group` and setting all the pixels to a colour of our choice.
```py
splash = displayio.Group()
display.root_group = splash

color_bitmap = displayio.Bitmap(160, 128, 1)
color_palette = displayio.Palette(1)
color_palette[0] = 0x00FF00
```
This creates a bitmap the size of the screen, creates a pallete with one colour and tehn adds the colour to the palette. In this case, `0x00FF00` is the colour for green. If you have some basic knowledge of hex codes, you can change this to any colour you want.
```py

bg_sprite = displayio.TileGrid(color_bitmap, pixel_shader=color_palette, x=0, y=0)
splash.append(bg_sprite)
```
This creates a tilegrid for the screen and links our shader (palette) to it. The `x` and `y` parameters are the position of the tilegrid on the screen. Since the bitmap is the same size as the screen, `(0,0)` will suffice. Then we attend the tilegrid sprite to the splash group which is where all the display elements are stored.

### Step 4 - Text!
Now that we know how bitmaps, palettes and splashes work, we can add some text. First, we need to import 2 new libraries, `terminalio` which provides a font for the text and `label` which creates a text label.
```py
import terminalio
from adafruit_display_text import label
```
To add a label, we create a text group for the label and then append our text, font and colour to it. Lastly, we append the label to our original splash group to update the display.
```py
text_group = displayio.Group()
text = "wsg hackclub"
text_area = label.Label(font=terminalio.FONT, text=text, color=0xFFFFFF) # White text
text_group.append(text_area)
splash.append(text_group)
```
This now appends our text to the screen! You can change the size and position by modifying the `x` and `y` parameters of the `text_group`. You can change the colour by changing the `color` parameter of the label. 

## Part B - IIC Screen (SSD1306)
The SSD1306 is a monochrome OLED display that communicates over IIC. It is very popular for small projects, and has very clear display. It is simple to hook up for quick testing and output. A lot of you might have used it while making your own hackpad/keyboard.

### Step 1 - Importing required libraries
Similar to the ST7735R, we need to import the `displayio`, `busio` and the `adafruit_ssd1306` libraries. The SSD1306 library can also be found in the Circuitpython library bundle. Copy the `.mpy` file into your board's lib folder.
Instead of using `fourwire.FourWire`, we will use `displayio.I2CDisplay` to create a display bus this time. The initialization process is similar but we will only need 2 pins this time rather than 5.

### Step 2 - Initializing the display
Initializing the display is similar to the ST7735R, replacing the `FourWire` class with `I2CDisplay`. The code is quite straightforward:
```py
from adafruit_ssd1306 import SSD1306_I2C
import displayio
import busio
import board
```
This imports the required libraries. Then we can initialize the display:
```py
displayio.release_displays()  # clear any display from previous runs
i2c = busio.I2C(board.GPxx, board.GPxx)
display = SSD1306_I2C(128, 64, i2c, addr=0xXX)
```
This initializes the display with a width of 128 pixels and a height of 64 pixels.
Make sure to replace `board.GPxx` with the actual GPIO pins you are using for the IIC clock and data lines. The address `0xXX` should be replaced with the actual IIC address of your display, although can be omitted if there is only one display on the bus. 

### Step 3 - Using the display
Now that the display is initialized, we can play around with the same things we did on the SPI LCD. However, since the display is monochrome, we don't need to mess too much with palettes or bitmaps. Instead, we can modify each pixel directly.
```py
display.fill(0) # black
# display.fill(1) for white
splash = displayio.Group()
display.root_group = splash

color_bitmap = displayio.Bitmap(128, 64, 1)
color_palette = displayio.Palette(1)
color_palette[0] = 0x00FF00 # green
bg_sprite = displayio.TileGrid(color_bitmap, pixel_shader=color_palette, x=0, y=0)
splash.append(bg_sprite)
```
This is very similar to the ST7735R, but we don't need to worry about the colours. Instead, we set everything to `1` (white) or `0` (black). From here, we can modify each pixel directly using the `color_bitmap` object. For example, to set a pixel at (x, y) to white, we can do:
```py
color_bitmap[x, y] = 1
```

## Wrapping up
Now that you understand a bit about setting up displays and setting colours/text, you can try out a lot of cool stuff with them. Make animations, create custom fonts, or even make a tile-based game with tile-grids! This will work for most SPI or IIC displays so you can try other displays like the ILI9341. The Circuitpython library bundle also features plenty of other display features like `adafruit_color_terminal` and `vectorio`. You can also experiment with making GUIs and custom functions! The Circuitpython documentation is a great place to start, and you can find the core libraries [here](https://circuitpython.readthedocs.io/en/latest/shared-bindings/).