# Designing your own projects

Designing your own projects is really, *really* hard. Here's my best explainer at what the process sort of looks like, but every person's process is different! You'll have to figure a lot of this stuff out on your own.

## Overview

You can split this entire process up into approximately 4-5 different steps, depending on what the project is.

During this entire process you're going to have to do a LOT of research on sourcing parts and what the pros and cons of getting each would be. During this time, PLEASE check out the [Part Sourcing](/advanced/part-sourcing) guide to get a better idea of the options

---

### 1. Vision, ideas, and outline

This is the first step of the process! During this time, you should figure out what you want your project should be, the constraints, and specific features you want.

---

### 1.1. Electrical component selection & sourcing

Next up is to pick the components for that

Try to avoid getting hung up passives. If there's multiple parts that are the same functionality

For actual sourcing & finding links, please refer to the [Part Sourcing](/advanced/part-sourcing) guide

---

### 2. CAD

**CAD (Computer-Aided Design)** refers to creating digital models of physical parts and enclosures.

Design mounts, housings, etc. Projects should have a case!

Add tolerances for fit: ~0.2–0.5 mm for sliding parts; tighten or loosen based on material shrinkage

Make it visually clean! It shouldn't just be a box.

Export only `.step` or `.3mf` files!



---

### 4. PCB


**PCB (Printed Circuit Board)** design maps electrical connections between components.

- Use KiCad schematics and routing
- Simulate circuits with [Falstad](https://www.falstad.com/circuit/)
- For tips and examples, check [Solder Start Guide](https://solder.hackclub.com/start!)


---

### 5. Firmware

**Firmware** is a type of low-level software permanently programmed to control hardware.

This is very dependent on your project, but always document this in your journal!



---


## Closing words

Keep in mind that almost every step above will be connected with each other. That means edits in #5 will mean you have to change #2, which might change #4, and then #2, etc. Hardware projects are *hard*. There's a lot of iteration involved. Good luck!
