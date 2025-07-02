# How to Make a Custom Devboard by @its_kronos
## Getting Started
Making a devboard might seem really complicated at first, but it's really more of a systematic approach based on what you want to complete and a lot of documentation.

The first step when making one of these (or many projects really) would be to `decide` what you actually want to be included into the devboard. 
For me, it was having the RP2040 as a main controller, some way to add WIFI, and the shape of bread. However, this may be completely different for you based on your interests.

![image](https://github.com/user-attachments/assets/00234edf-2cf8-4f03-ba1b-dbf3fa276d63)

## Creating a schematic for the microcontroller
---
This part of the design process should be where most of the research for your project takes place, and for this guide, 
I will be showing how one would use the RP2040 chip, but please feel free to use another one that may better suit your purposes.

First, find the hardware documentation for your microcontroller (`MCU`) ([RP2040](https://datasheets.raspberrypi.com/rp2040/hardware-design-with-rp2040.pdf)) and go through it. 
Different controllers may have different requirements. For example, some might have certain things built in like `flash memory` while other may lack these features and require external components

---
### Power
Depending on what controller you chose during the brainstorming phase, it can have different requirements for power. For most devboards a USB connection is how power and data is transmitted to the board. 
USB (**excluding PD bricks**) gives a voltage of 5. If an `MCU` expects a different input voltage, you are required to include a voltage converter (`LDO`) to power it. 

`(Including USB might have a few extra steps, such as creating a custom footprint based on the layout given on the documentation for your specific USB receptacle, but as there is already another guide for this, I will not be going over it here.)`



For the RP2040, it requires 3.3Vs, so we could use any `LDO` that can drop 5 volts to 3.3 volts (preferably a fixed converter with a high enough maximum amp load). 
Different `LDOs` may have different recommended layouts, so please make sure to check the documentation of the one you are using for this. 

For my board, I used the `NCP1117`, which in the data sheet tells the user to use the following layout:
![image](https://github.com/user-attachments/assets/8f3375d9-2d86-43d2-93d2-58f1b2a6d4d1)

---
#### If you plan to use a USB-C to USB-C connection, you must use pull-down resistors of 5.1k Ω
![image](https://github.com/user-attachments/assets/70a32756-9c88-4263-8b58-4d60f0160d30)

---
Now, we can focus on the power closer to the MCU. Sometimes, a controller might require more power temporarily to perform its tasks. 
In order to hold some energy for these cases, we use `decoupling capacitors`. (*The amount of capacitance may vary based on your MCU.*)

For the RP2040, we should have 100nF for each power pin and 1uF for each internal voltage regulator pins (`VREG`), which convert the 3.3V supply to 1.1V for the RP2040s internal logic (you don't need to worry about this).

![image](https://github.com/user-attachments/assets/01b3fa7d-8472-4d89-8789-fb4809d10f91)

---
## Flash Memory

Certain MCUs have a maximum amount of memory that they support, and for the RP2040 it is 16MB/128Mbit. 

If you're using the RP2040, I would recommend for you to use the `W25Q128JVS` flash memory due to it being a basic part and also requiring one less resistor when used with the RP2040

The pins on the RP2040 used for the memory are the QSPI pins. 

