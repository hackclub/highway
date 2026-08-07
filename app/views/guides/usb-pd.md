Ever made a circuit on a breadboard and wished you didn’t have to fiddle around with low capacity 9V batteries? Well, this is the tutorial for you! We’ll be making a USB-C PD PCB for all of your breadboard design needs! 

# Schematic
First, we’ll need a USB-C port. There are several options available, but using a 6-pin one makes the most sense because we will not have data. I went with C668623. 

Next, we want some sort of way to connect our PCB to the positive and negative terminals on our breadboard. You can either use male/female dupont connectors, or what I went with, screw terminals! They’re more versatile than dupont because you can use both bare wire AND regular breadboard wires. I went with C5183989. 

Let’s wire up the USB-C port now! You’ll notice that our USB-C port is mirrored with two GNDs, two VBUSes, and two CCs. Let’s connect power and ground up. Note that we will also connect the shield to ground. 
<img width="406" height="197" alt="image" src="https://github.com/user-attachments/assets/708d95c8-1159-40be-8499-27b9a7a776f9" />

The USB-C protocol requires you to connect CC1 and CC2 to ground via 5.1k resistors for 5V output. It’s a whole thing, but that’s pretty much all you need to know. I’ll use C27834. 
<img width="390" height="135" alt="image" src="https://github.com/user-attachments/assets/b2339a15-4e13-45f2-809c-7fcde2541f74" />

Next, we need to add something called decoupling capacitors. It sounds super complicated, but it’s really not. When transmitting power, there are bound to be inconsistencies. We can stabilize those inconsistencies with capacitors. I’ve drawn this little drawing to explain it:
<img width="631" height="129" alt="image" src="https://github.com/user-attachments/assets/85ed2823-1ac5-4047-b8b0-106b871fd974" />

I’ll use the model number C49678. It should look like this:
<img width="279" height="206" alt="image" src="https://github.com/user-attachments/assets/fc1220be-031e-419d-a669-f6e5c97a73a4" />

Next, let’s add a status LED so we know power is connected (super useful while debugging). I’ll use C2297 for the LED and C17513 for the 1k resistor. It should look like the following:
<img width="94" height="306" alt="image" src="https://github.com/user-attachments/assets/4815d0a5-5147-42e0-ad88-00fb32ff0e12" />

Finally, let’s hook up our screw terminal. We can simply connect it to the GND and 5V of the LED. 
<img width="277" height="333" alt="image" src="https://github.com/user-attachments/assets/3d5c58b8-ccab-4225-9f82-dc7b84d7ee49" />

Let’s add a decoupling capacitor for good measure (and stability). We’re done!
<img width="282" height="366" alt="image" src="https://github.com/user-attachments/assets/d76b7c88-94b4-4212-934a-2b512f42b9c5" />

# PCB
Let’s make our PCB now! This is honestly pretty easy as we just connect stuff together. Make sure to have your decoupling capacitors near the power pins. Also, a good layout can make routing a bajillion times easier. This is how my project ended up:
<img width="434" height="622" alt="image" src="https://github.com/user-attachments/assets/70f62355-9245-43ff-b611-a6aae3084529" />
