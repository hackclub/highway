# Sourcing parts

Welcome to part sourcing! Here's a ton of tips for you to optimize your part selection & costs!

If you're ever unsure of your BOM, send it in #highway! People can definitely help you pick better parts and make better decisions.

## Overview
When picking parts, PLEASE be resourceful! Make the most out of every dollar and don't take the entire budget just because you can

#### Do's

- Lots of research into what parts to use!
- Ask in #highway for advice on picking parts

#### Don'ts

- Buy a $100 Oscilloscope
- Buy extra parts for "later projects"
- Buy a $40 module on amazon instead of waiting 2 weeks to get it for $5 instead

At the end, everything should be in a BOM with links to specific parts.


## Specific parts

### General

Generally speaking, try to reference parts off of other projects since you'll eliminate more unknowns with the hardware

### Modules (TP4056, LED matrices, etc)

Almost always the cheapest option is to get it from AliExpress; the only downside is that shipping *may* take awhile - usually a 2-3 week buffer is safe.

If you're in a pinch, Amazon actually has OK prices all things considered. I would avoid it though, unless you're going to miss Undercity if you don't use them

### SBCs (Raspberry Pi, Orange Pi, etc)
Raspberry Pi
You can get Orange Pis from aliexpress.

Depending on your application though, you can also repurpose old laptops/desktops for your specific application if it's not space-sensitive

### Microcontrollers (arduino, RP2040, etc)
AliExpress is still usually your go-to for this! 

Arduinos are fairly outdated by todays standards

### PCBs

- If you're in India, use [SEEED Studio's Fusion Service](https://www.seeedstudio.com/fusion_pcb.html). They take HCB cards and are by far the cheapest option
- If you're from another country, use JLCPCB, they offer PCBs for under $6 shipped as long as its under 100x100mm
- If you're from the US specifically, use PCBWAY. They're roughly half the cost of JLCPCB because they're able to avoid tariffs somehow
    - Read here: [link](https://www.pcbway.com/blog/News/Impact_of_the_New_U_S_Tariff_Policy_on_Customs_Clearance_51dff4fd.html)
- EING is not allowed unless you have golden fingers (on-PCB USB-C contacts etc. and this is also subject to a case by case approval, please also mention it to your reviewer).
- Edge plating isn't allowed if it is only for the looks.
- You should just choose the cheapest options that gives you a working pcb

### Batteries (Li-Po, CR2032, AA, etc)

## Country Specific Notes

### Egypt:
#### Parts
- Egypt has a store called RAM Electronics, which holds a certificate from Cytron, and it offers products at a significantly lower price. ([link](https://www.ram-e-shop.com/))
- Additionally, there is Flux Electronics, which offers a wide range of 3D printer Parts and a vast selection of electronics. ([link](https://fluxelectronix.com/))
#### 3D printing service
- There is Printfy3d, it accepts HCB cards, and it is a good choice. ([link](https://www.printfy3d.net/3d-printing))
  


### India:
- Most vendors do not take international cards [cards issued outside India], which unfortunately, HCB falls into the category of. Contact your local vendors to try to get that changed!
- Here are some vendors that are documented to work with HCB cards currently, segregated into categories
  * Electronic parts (RPIs, modules, power supplies and the like)
    * [Silverline Electronics](https://www.silverlineelectronics.in/)
    * [RoboSap](https://robosap.in/)
    * [RoboticsDNA](https://roboticsdna.in/)
    * [EBhoot](https://ebhoot.in/)
    * [Electronicscomp](https://www.electronicscomp.com/)
    * [Sharvi Electronics](https://sharvielectronics.com/)
    * [Novo3D](https://novo3d.in/)
  * 3D printed parts (3D printing as a Service, JLC3DP-alike)
    * [3Ding](https://www.3ding.in/)
    * 

> confirmed more vendors? wanna add specific notes for your country? contribute [here](https://github.com/hackclub/highway/edit/main/app/views/advanced/part-sourcing.md)!! You'd be helping a ton of people!

## Tips for specific vendors

### AliExpress
Aliexpress is one of the highest skill ceiling stores out there - there's a ton of optimisation you can do. Here's some tips:

- The welcome deal only works once when you make your account, so don't budget off of that - you will be hit by significantly higher prices afterwards.
- Pay attention to the estimate shipment date. This will vary by region, but generally speaking it's actually fairly reliable
- Also pay attention to the shipping cost! Usually items that don't have free shipping but a lower initial price actually end up being more expensive when you tally the costs
- There's specific vendors that are useful:
    - AITXEM ROBOT: Any microcontroller you can think of
    - Trianglelab: 3D printer parts!

## Other resources

COMING SOON!

<!-- ### VORON Sourcing guide

### ANNEX ENGINEERING Sourcing guide -->
