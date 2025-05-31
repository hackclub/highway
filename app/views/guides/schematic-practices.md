# Schematic best practices
This guide is based on the [amazing video](https://www.youtube.com/watch?v=R_Ud-FxUw0g) from EEVBLOG. If you want to see more examples, and things that I might have left out, check it out.
## Power symbols
Always point ground symbols down, and power symbols up! If you are really space constrained, then its okay to turn them sideways, but if you can don't!  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/f274ca4931f39c0653de7a6d61080d24856727d1_screenshot_20250531_172847-1.png)
## Pull-up and pull-down resistors
Put pull-up resistors above the line that you want to connect, and pull-down resistors below the line.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/56b9d40dca4788db5d83e1633fb2ba1c8e9b7e51_screenshot_20250531_180709.png)
## Lables
Don't leave labels hanging in thin air, always have a line beneath them. If you labels aren't just for naming, and they connect to somewhere else in the schematic, then make them a separate line to signify that they go somewhere else in the schematic.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/2bc0caea070255f400ed02add7e8a85459fa7f25_screenshot_20250531_180535.png)
## Placing symbols next to each other
Don't let two symbols touch, always have a wire between them.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/8de2bc576e62835e48d01e9d2bd6f7d86ab38b6e_screenshot_20250531_180603.png)
## Wires should not go through pins 
If you have a microcontroller and want to connect multiple pins together you should wire one wire through all of them, instead you should leave a little space between the one wire and connect each pin individually.  
![img](https://hc-cdn.hel1.your-objectstorage.com/s/v3/817b83c6d180b57cad4871c8c0cc621b9ffc7c71_screenshot_20250531_180405.png)
## Data flows from left to right in a schematic
So if you have some inputs, you put those on the left, and if you have some outputs, you put them on the right, and the processing in the middle.
