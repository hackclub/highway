# The checklist for making mass produced pcbs

So I've been charged with the amazing opportunity of making the badges for undercity. (Thanks acon and alex!) And during this process, I've learnt a lot. So I'm going to write the lessons learnt for future reference :)

*Organizing*

* Always write up a clear schedule - make a plan of how long everything takes (So called "Cahier des charges")
* Find people you can trust and share tasks with them
* Communicate clearly - don't be afraid of bothering people
* You might need to bump people

*Schematic*

* Use Altium or KiCAD, never easyeda
* Make it clear and readable, organize everything into functional blocks
* Everything must fit in the A4 paper, if not make a new sheet
* Copy as much as you can from *trusted* sources (Adafruit, manufactuer examples etc)
* You can find a lot of these references here: https://certification.oshwa.org/list.html

*PCB*

* Use the default KiCAD drc rules
* Use mostly .3 .6 vias, .2 .45 are only reserved for emergencies
* Follow best practices - the max amount of vias per signal lane is 2, I doubt HC will have custom merch that is complex, so if you have more then 2 vias you did something wrong
* Double check the integrity of your ground plane - you do not want to knock out the WiFi
* Double check all footprints yourself - never trust 3rd party footprints

* If a footprint doesn't exist, make it yourself, don't go downloading from EasyEDA
* Always take a checklist and check off everything
* I prefer using these two (both of them): https://libsharedobject.so/howsmypcb.html and https://github.com/azonenberg/pcb-checklist/blob/master/layout-checklist.md

* Be wary of solder mask exposures on copper traces - they might lead to shorts
* Plan out where you will source all the components
* Prefer cheaper components over basic JLCPCB parts

*Ordering*

* Kidnap at least 5 people to check your design
* Never trust the others that you kidnapped, double check everything yourself
* Draw out how everything will fit together
* Always order a development batch
* The development batch doesn't need to wait for art, for outline or anything - just have it be a functional replica
* Before ordering, always go sleep and re-check everything
* Do the paneling yourself - use KitKit
* Prefer V-Cuts to mouse bites
* You can pay JLCPCB to de-panel the PCBs
* Double check all options selected (For example you need EING and beveling for gold fingers)
* Pay for production file confirmation

*Firmware*

* Check the USB-C cable, 99% of the time it's the cable's fault
* Use a Makefile to make a good build system - don't use arduino IDE
* Do not trust libraries on the web even if it has 1k stars, they are a scam and doesn't work
* Always download example code straight from the manufactures
* If something doesn't work, 99% it is the firmware's fault - hardware is difficult to break
* Kidnap at least 2 more people to debug the code with you

- Cyao <3
