# Schematic best practices
This guide is based on the [amazing video](https://www.youtube.com/watch?v=R_Ud-FxUw0g) from EEVBLOG. If you want to see more examples, and things that I might have left out, check it out.
## Power symbols
Always point ground symbols down, and power symbols up! If you are really space constrained, then its okay to turn them sideways, but if you can don't!  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/fce47ae59b3a809eef115a7e21fda20d738eb025_screenshot_20250618_190233.png)
## Pull-up and pull-down resistors
Put pull-up resistors above the line that you want to connect, and pull-down resistors below the line.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/56b9d40dca4788db5d83e1633fb2ba1c8e9b7e51_screenshot_20250531_180709.png)
## Lables
### Dont leave them hanging
Don't leave labels hanging in thin air, always have a line beneath them.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/cf8e7aa62cf7ae5de47550aef6927d50d550f92d_screenshot_20250602_220131.png)
### "Naming" labels VS "Connecting" labels
If you labels aren't just for naming, and they connect to somewhere else in the schematic, then make them a separate line to signify that they go somewhere else in the schematic.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/1eb1a7e934b8457900ab6de16d6eb7a81ec3fc48_screenshot_20250602_220143.png)
## Placing symbols next to each other
Don't let two symbols touch, always have a wire between them.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/8de2bc576e62835e48d01e9d2bd6f7d86ab38b6e_screenshot_20250531_180603.png)
## Wires should not go through pins 
If you have a microcontroller and want to connect multiple pins together you shouldn't wire one wire through all of them, instead you should leave a little space between the one wire and connect each pin individually.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/817b83c6d180b57cad4871c8c0cc621b9ffc7c71_screenshot_20250531_180405.png)
## Data flows from left to right in a schematic
So if you have some inputs, you put those on the left, and if you have some outputs, you put them on the right, and the processing in the middle.  
*The image form the next section is also good for this section, so look at that*
## Break up you schematic into blocks
You should break up our schematics into blocks based on their function, for example you should have a power block, adc block, etc. If you run out of space on one sheet, you could split you schematic up into multiple pages/sheets, but don't overdo it, its also bad if your schematic is to segmented.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/247e79820df21141cf57da1f030283234846433d_screenshot_20250602_221529.png)
## Place decoupling capacitors next to what they decouple
Don't put them at the other side of the schematic, put them close to what to they decouple.  
### Do this
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/b9a035bc201159cd6fcc5286b39ed862794427e5_screenshot_20250602_223302.png)
### Not this
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/eb7a24622a190a0e47318e25d547b445129a4965_screenshot_20250602_223631.png)
