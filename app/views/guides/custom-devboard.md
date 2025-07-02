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
### USB DATA

Depending on the MCU, resistors might be needed on the data lines, and for example, the RP2040 requires 27 Ω resistors. 

![image](https://github.com/user-attachments/assets/d6df4a85-5d55-451b-8e7f-9c93f1fccc2f)

Furthermore, it could also be beneficial to add ESD protection to the datalines and VBUS, which prevents static discharge from damaging the connection. You should do your research on which one(s) to use, but personally I chose the USBLC6, which should be wired as such (according to the documentation):

![image](https://github.com/user-attachments/assets/47d19361-be94-47ee-8891-adf13c97e01c)

---
### Flash Memory

Certain MCUs have a maximum amount of memory that they support, and for the RP2040 it is 16MB/128Mbit. 

If you're using the RP2040, I would recommend for you to use the `W25Q128JVS` flash memory due to it being a basic part and also requiring one less resistor when used with the RP2040

The pins on the RP2040 used for the memory are the QSPI pins (which communicate via an SPI interface).

The wiring for this specific flash and MCU should be as follows (with the 100nF capacitor being for decoupling):

![image](https://github.com/user-attachments/assets/0c14d190-39e1-4723-8085-e3c78aa2a0a2)

The QSPI_SS pin is special because when pulled down, it enables BOOTSEL mode if the chip is starting up (or reset), which is the mode where one is able to flash the controller which their code. Normally, the QSPI_SS pin is floating shortly after startup, and then proceeds to be pulled up. To ensure proper behavior, the QSPI_SS pin might need to be pulled up to 3.3V through a 10k Ω resistor, but `with this combination of MCU and memory`, it has been proven to not be needed

With any flash for the RP2040, the QSPI_SS pin should have some way to be switched to ground through a 1k Ω resistor (which could be something like a button as shown but could also be headers that one has to connect)

---
### Oscillator

An oscillator serves as the basis for each tick/clock cycle in a microcontroller. There can be many different speeds that different MCUs require, but generally they all have an input, output, and require capacitors depending on their load capacitance (specified in documentation). 

If you are working with the RP2040, you should use the `ABM8-272-T3` (12 MHz crystal) due to it being tested in various conditions (such as varying temperatures) and found to be steady. 

Additionally, depending on the voltage given to the MCU a resistor should be placed from the output for the crystal from the MCU to prevent too much current. If you are using 3.3 volts, you should have 1k Ω of resistance.

Next, the load capacitance for the crystal should be split among the input and output pins, with the total being calculated as: (C2*C3)/(C2+C3). This total should be slightly under the load capacitance because of natural capacitance (`parasitic capacitance`) between components when under current (due to magnetic fields). Assuming around 3pF of extra capacitance should be fine ***if you keep your traces short and direct when routing***

Keeping all these considerations in mind, the wiring of the crystal should look like this for the RP2040:

![image](https://github.com/user-attachments/assets/91362a6c-15e1-409a-918a-b27c9c9438ee)

---
### IO pins and resetting the board

For the most part, IO pins can be wired as you please, but it would be a good idea to include multiple ground pins to reduce interference from noise affecting GPIO pins (which should have little to no impact if used for low-speed circuits, but it is better to include it to offer support for work with higher frequency).

To reset the board for any purpose (including BOOTSEL mode), the `chip enable` pin (called RUN for the RP2040) should be pulled down. For ease-of-use I recommend including a button or pin headers through a 1k Ω resistor to ground, similar to the QSPI_SS pin.

*Note: For the header footprints, you should use the one with `2.54 mm` spacing due to that being the most common standard*\
*Also, you may wish to include SWDIO and SWCLK on some pins, and these are mainly used for debugging*

![image](https://github.com/user-attachments/assets/dd96603e-2a0e-47a0-af53-5f59c600d1a5)

---
## Routing the PCB

When routing the PCB there are several important things to keep in mind, which will be listed here:

- Decoupling capacitors should be kept close to the pins they decouple, but if your unable to fit all of them, it is fine if some pins share one (but ***only if absolutely necessary***)
  
![image](https://github.com/user-attachments/assets/f9135326-006d-45f1-976d-317adb617ee5)

- High frequency signals, such as a crystal oscillator, flash memory, and USB data lines should be kept away from each other (since changing currents cause changing magnetic fields -> induced current)
- These signals should also be under a ground plane and have minimized trace length.

![image](https://github.com/user-attachments/assets/a9532e63-1f73-4d08-8c7f-66d6a32903fd)

- USB datalines should be impedence-matched to have a differential impedence of 90 ohms (calculate the width needed for a specific inputs using an [online calculator](https://www.elektroda.com/calculators/pcb-impedance-calculator-edge-coupled-microstrip) \[dielectric constant depends on board material and other factors which you should check with the manufacturer (use 4.5 for JLCPCB)])
- The datalines are differential pairs, which should be routed using the differential pair routing tool (by pressing 6, or going to route-> differential pair) **AND** length matches to be equal (route->
tune skew of differential pair)
- You might have to change the design rules for the USB dataline netlist in order to stop the DRC from screaming at you (board->board setup->design rules->net classes)
- The 90 ohms is pretty lenient for the USB speeds on a microcontroller (higher speed=less lenient), but it is still important to use good design practices

![image](https://github.com/user-attachments/assets/1885f2b0-e897-4c5a-950f-20ca955ad11f)


- Crystal components are very noisy! You should include vias around it connected to a ground plane to minimize the effect on the rest of the board.

![image](https://github.com/user-attachments/assets/31bc0122-caf7-47fe-a20f-5c4ed8db1a66)

- Resistors for the USB data lines should be close to the MCU

![image](https://github.com/user-attachments/assets/207ef5ad-4809-4d54-b2f6-34ee31b393c8)


- The LDO should be close to the power source (AKA USB input)

![image](https://github.com/user-attachments/assets/8c0f64fe-9eda-4e42-b818-c10e2ab01d4d)

- Depending on the power usage, it might be a good idea to increase the trace width for power traces
  
![image](https://github.com/user-attachments/assets/2597f66f-bd8c-42e2-ad44-9ad49480c6df)

**Ok guys now for the MOST important rule when designing**

# HAVE FUN!

(If you have any questions don't hesitate to reach out on Slack - `@its_kronos`)

