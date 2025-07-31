# How to make an ESP32 based dev board

Written by: Madhav Garg

Halo! This is a guide on how to make an ESP32 based board.

## Step 1: Chose a chip.

Personally, I would chose an ESP32 module, and that too one on JLCPCB that can be assembled with their standard assembly tool

So far, I have only found 2 ESP32 modules that fit this catagorie.

1. ESP32-WROOM-32D-N16

2. ESP32-S3-MINI-1 N4H2

Personally, I would recomend the MINI, because it has a whole lot more GPIO, is smaller, and has more mixed performance.

## Step 2: Schematics

If you are using the MINI, I would suggest following the following schematics:

First of all, you need decoupling, as shown here:

<img width="427" height="292" alt="image" src="https://github.com/user-attachments/assets/596f48e5-2753-4540-a7c2-027b2aaf55b8" />

Next up, you need an interface. You can chose either MicroUSB or USB-C, and I have schematics for both. If you want MicroUSB, you can use this:

<img width="732" height="483" alt="image" src="https://github.com/user-attachments/assets/b2459950-d57e-446f-ba1a-6ff75bd50e21" />

And for USB-C, the one I recomend, you can use this one:

<img width="691" height="627" alt="image" src="https://github.com/user-attachments/assets/a2dd3809-a761-471d-aecf-e509541aeaf5" />

It should be noted that I have use ESDs, electro-static protection diodes, and although they are not strictly nessasary, they can be useful.

One last thing you need, is an LDO.

Personally, I rather like the NCP1117DT33G, as shown in the following schematic:

<img width="910" height="619" alt="image" src="https://github.com/user-attachments/assets/5950b1fe-25a2-4b57-aa45-aeb773c7d29b" />

However the official carrier board uses the following setup:

<img width="719" height="386" alt="image" src="https://github.com/user-attachments/assets/8425b2b1-fc09-4d8b-badf-5269e37350ba" />

An advantage of the NCP is that it can accept upto 20V input, and thus has a very wide application voltage.

One thing to note here is that you need to chose a sufficiently capable size for capacitor C4, as it may be experiencing a higher than rated voltage. Generally, when looking for a capicitor that can handle low voltage, ie 3.3V an 0402 is ok, but for higher voltages like 12V, I recommend an 0603, and even higher voltages should have 0805s or bigger.

A side note, using higher capacity capacitors, ie 10uf meanse that they can handle a lower voltage. ie 10uf 0402 --> 6.3V, 100nf 0402 --> 50V!

## Step 3: Layout

Finally, you should lay them all out. It is essential that you have the board either hanging off, with the antenna part not having any copper underneath it, or not having any board.

<img width="600" height="284" alt="keepout_3D" src="https://github.com/user-attachments/assets/7a187d75-ca47-41f0-a08b-c0108257acb8" />

<sub> You can see the 2 different kinds of keepouts here <\sub>

![images](https://github.com/user-attachments/assets/cb37ad2c-5d28-41f6-bd8f-2ec5f959deae)

<sub> the keepout dimensions <\sub>

Basically, don't do this:

<img width="362" height="108" alt="image" src="https://github.com/user-attachments/assets/cd4017c1-8f57-40a3-b62f-ffe1c592f902" />

Wifi can get messed up by metal, and having the board so close is definitely not following the shown keepout dimensions.

And that's about it. I'll leave the wiring part up to you, but normally you should keep the decoupling capacitors (C1 & C2 in the first schematic) as close as possible two the chip.

## Step 4: User features.

The board as it is right now will work, but it will be a pain to debug and use fully.

Thus, I recommend adding a few quality of life imporvements

### 1. Add buttons.

That means that you should have one button that shorts ESP_RST

<img width="254" height="30" alt="image" src="https://github.com/user-attachments/assets/20a8a478-5a94-44df-9a93-75a33e3a8be6" />

to ground, and one that shorts IO0 to ground.

<img width="1157" height="399" alt="image" src="https://github.com/user-attachments/assets/1dc2a2c2-2c46-436d-826d-8e8db35b8ab4" />

You can also add some debouncing capacitors to make them work more predictably, as shown.
### 2. LEDs

LEDs never hurt. (except for power consumption)

So, I would suggest throwing them in wherever you feel like there is a chance the board is at fault, to make sure everything is good, ie after the regulator:

<img width="206" height="444" alt="image" src="https://github.com/user-attachments/assets/0478aa16-1d00-4a7b-af2e-c240616ee8fe" />

That's it, and well if you need you can contact me on slack (@madhav)

