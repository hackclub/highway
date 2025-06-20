# Keyboard

#### Tier 2 project (6 points)

Hi, I'm Dodge1, and this is my guide for designing your own keyboard. It's mostly covers the stuff on the footprints/more advanced stuff as you can learn the basics for PCB design and keyboards from [hackpad](https://hackpad.hackclub.com) and [solder](https://solder.hackclub.com).

## 0. Planning
You first want to figure out a general layout for how you want the keyboard to be. Do you want it to be a full 100% standard ISO 104 keyboard or something closer to a column staggered ortholinear split 40%? You don't really need to have a finalized design as you can easily modify your schematic to add extra keys if you have GPIO pins and route them in the PCB later. To do so, you can use tools like [ergogen](https://github.com/ergogen/ergogen) ([web](https://ergogen.cache.works/)) and [Keyboard Layout Editor](https://keyboard-layout-editor.com/). There are plugins in KiCad to autoplace the PCB -you will still have to route (DO NOT USE AUTOROUTING)- and it will also make the case a bit easier but it is not required. The second part is picking your keys. While you can again do this before making the PCB and quite a few keys use the same footprints, it's still a good idea to have a vague idea of what you may want - low profile, tactile, clicky, linear, etc. Now that you have a vague idea of what you want to build, let's get started!

## 1. Schematic
Your schematic shape doesn't matter. This means if you are running out of pins with a 4x10 grid, you can change that grid to 7x6 and still have 2 more spots for switches. Since this can sometimes make the design harder, many people opt to have one column on the schematic wrap around make 2 columns on the PCB/layout and then double up on rows. This doesn't always produce the optimal number of switches per pin but is easier if you have room to spare. You do also need diodes on every key, it is usually cleaner and easier to do if you use the 45 degree sw\_push schematics and place the diodes such that they connect to the row wire. This again isn't required like most things and just makes your life easier. If you really wanted to, you could probably make a 1 layer keyboard though I *really* wouldn't envy you.

## 2. PCB
Your next part is the PCB. This is arguably the easiest part (takes a while though) and mostly just contains resources to help make it faster. The main thing is to use one side for rows and the other for columns. You don't need vias or anything, just use the two sides and you shouldn't have any routing problems. Still try to keep your keys relatively close in terms of your schematic as it'll make your life much much easier. I would recommend printing your PCB to scale on paper to see if it fits your hand and you find that many of the keys are natural and easy to type. For footprints, there are plugins in the Content and Plugin Manager like I mentioned before that allow you to auto place as well as easily get footprints. For footprints, the "Keyswitch Kicad Library" and [siderakb's library](https://github.com/siderakb/key-switches.pretty) should have most of the stuff you'll ever need. Otherwise you can just google the switch name or make your own footprint based on the spec sheet. The "Keyboard footprint placer" and "KLEPlacement" plugins help you place from KLE with the latter also having experimental support for ergogen.

## 3. Case
The final part is the case. Export your file from your pcb software in a format that your CAD software can import. From here, just design a case similar to hackpad. If you do want a slanted keyboard, you will need a wedge underneath it to prop up the PCB at the angle that you want. I would recommend leaving at least a bit of space under the PCB for tape modding as well as general acoustics.

And voilà! You have a keyboard (you just need to manufacture it...)


Analog keyboard guide coming soon™.
