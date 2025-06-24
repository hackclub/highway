# Decorative CAD

*Written by @egg_splats on slack* <br/>
[check out my project!!!](https://github.com/hunkegg/biblicallyaccuratekeyboard) <br/>

This is less of a *guide* per se, and more so a collection of CAD techniques used to make the decorative aspects of my previous and Highway projects. <br/>
<img width="300" alt="biblically accurate macropad" src="https://github.com/user-attachments/assets/cb085ad5-4f34-4af0-8f13-1538632a181c" />
<img width="300" alt="toy truck bumper attachment" src="https://github.com/user-attachments/assets/c9f5d41c-9ce6-412b-83b6-dd5bdc61d720" />
<img width="180" alt="shrimp" src="https://github.com/user-attachments/assets/51bec500-ec75-4bdb-b8f4-4decb190dfcb" /> <br/>
> this guide will sadly only go over Fusion, but onshape usually has lots of features similar to those mentioned in this guide!

| table o' contents |
| --------- |
| general tips! |
| Method 1: Fillets/Chamfer |
| Method 2: Edit Form |
| Methdod 3: Surface Tools |

## General Tips!
I mainly want to get these out of the way first, since they can be applied to nearly anything in CAD, whether decorational or not! <br/>

### 1) Construct tools are GOATED
The Contstruct Tools in Fusion are a set of tools that allow the user to create objects to base sketches or commands off of. While they may seem useless at first, they can be extremely helpful in making more custom and cooler designs! <br/>
<img width="290" alt="image" src="https://github.com/user-attachments/assets/c8852a5b-5e39-4930-92f8-8ba69e4039d9" /> <br/>

For example, in my Highway project, I could've copy and pasted a keyswitch section 8 times and moved them around to form a ring, but I instead used the Construct tool **"Axis Perpendicular to a Face at Point"** in combination with a sketch to create an axis of rotation to use a Circular Pattern. (i know that sounds like jargon but i'll try my best to break it down) <br/>

Essentially, the Circular Pattern tool allows me to copy a part in Fusion around in a circle, and requires an axis to rotate around. First, I drew a sketch on the part to find the "center" of the ring, then created an axis through that point with the Construct tool. Since that axis is exactly in the center of the ring, I can use that axis for my Circular Pattern, making the process **MUCH** easier and faster.
<img width="500" alt="image" src="https://github.com/user-attachments/assets/2db0929d-6e11-4346-a48f-19b6868ea3f1" />
<img width="300" alt="image" src="https://github.com/user-attachments/assets/386dabd5-77ed-4991-af41-e2b07769ca46" /> <br/>

Construct tools often feed or help with other tools, such as **Offset Plane** or **Plane at Angle** helping with *custom angles in sketches*, or the **Axis** tools helping with Pattern-type tools like *Rectangular/Circular Pattern* as mentioned above. I ***strongly*** recommend learning these if you want to improve your modeling! <br/>
> offset plane is my favorite btw, super good for the loft tool!

### 2) Learn more Fusion tools!
While *Extrude* may get you by 80% of the time in CAD, learning other tools can help spice up your design! I ***strongly*** recommend getting familiar with the 4 tools mentioned below! <br/>
<img width="200" alt="image" src="https://github.com/user-attachments/assets/7056a717-a406-4fcc-861b-c495956f2f9e" /> <br/>
| tool name | purpose |
| --------- | --------- |
| extrude | the basic extrude; extends a sketch perpendicular to the sketch plane |
| revolve | revolves a sketch around an axis; good for objects like vases or bottles |
| sweep | extends a sketch along a custom path (often another sketch perpendicular to the other sketch plane); good for pipes or tubes |
| loft | connects the edges between two sketches; good for adapters or in my case, keycaps! | <br/>
<img width="500" alt="image" src="https://github.com/user-attachments/assets/ac7770c9-49d8-4afa-98f3-85479e84b25d" /> <br/>
> an example of loft in action! I used **Offset Plane** to create the other sketch, then used loft to create the general shape of the keycap

Here is a list of other Fusion tools I recommend learning:
| tool name | purpose | picture (zoom in!) |
| --------- | --------- | --------- |
| Project | used in sketches, projects a 3D object onto a sketch plane. ***VERY*** helpful in designing screw holes for PCBs or for making correct sizings for other parts like keycap stems. | <img width="200" alt="image" src="https://github.com/user-attachments/assets/9f5f5617-2b5f-449c-8aa9-b5ddc8406e4c" /> |
| New Component | used to store components in CAD. helpful for organizing models with a million imported components like my keyboard. | <img width="200" alt="image" src="https://github.com/user-attachments/assets/29b4c461-d6ad-438b-8910-97c9c8b562b1" /> |
| Appearance | used to add materials and colors to bodies in your model. helpful for visualizing the final result, as well as making the CAD pictures for submission look pretty :D | <img width="212" alt="image" src="https://github.com/user-attachments/assets/decc3739-2dc6-4afb-a61a-2c28bc0239c0" /> |
| Constraints | used in sketches, constrains certain elements like lines or points into a "relationship" (equal length (equal), at the same point (coincident), perfectly horizontal/vertical, etc.). **Very** helpful for designing geometric or precise sketches like the mount and casing of a PCB. | <img width="183" alt="image" src="https://github.com/user-attachments/assets/e6b2eebf-0734-4add-bd32-063404720a5c" /> |
| Canvas | used to add a picture on a surface as reference for modeling. ***VERY*** helpful for designing decoration, such as the eyes on my keycaps/center, since you can just trace the canvas without issue. | <img width="285" alt="image" src="https://github.com/user-attachments/assets/5d97f813-9938-439f-a2b1-de7d4b46b8ec" /> |
<img width="500" alt="image" src="https://github.com/user-attachments/assets/ee7dd8b4-ef46-4820-bf80-4b7b0c1c7fa6" />
<img width="500" alt="image" src="https://github.com/user-attachments/assets/a1f6f433-caca-4818-b1c7-5641d2193268" />
> examples of using the Canvas tool to design the decorative eyes!

## Method 1: Fillet/Chamfer
This is by far the simplest way to make something that looks nice. <br/>

I used fillets extensively in my custom keycaps and eye, where I needed to replicate an organic-like shape. Sharp angles are typically not seen in nature, and are often used in more modern/futuristic or man-made designs, such as my toy truck bumper attachment I made for a school assignment. While both can be used interchangably in a simple design, such as making a macropad look a tiny bit better, knowing where to put fillets and chamfers can make a pretty noticable difference.<br/>

<img width="800" alt="sugarcoat" src="https://github.com/user-attachments/assets/bdaedd31-52d1-4240-b709-7a50df6b2bc4" /> <br/>

### rounding extrusions!
While fillets are typically used to only round down external edges, the fillet and chamfer command can actually do much more! For example, fillets can round out interior edges, such as the intersection of the bottom and wall of a box. <br/>

<img width="500" alt="image" src="https://github.com/user-attachments/assets/ac676772-4b97-4b78-8fb3-984398323ef5" /> <br/>

Furthermore, the radius of the fillet can extend much further than the height of the wall/floor, allowing for fillets that are "more than 90 degrees" in a sense. <br/>

<img width="500" alt="image" src="https://github.com/user-attachments/assets/504a717b-1322-4ec2-9233-e788d10615c8" /> <br/>

The combination of this technique, as well as some regular fillets are what allowed me to create the unique geometry of the eyes found on the center of my Highway project. The eyelids first started as a regular and boxy extrude, then was blended into the face of the center with an extended fillet, then rounded off by placing more fillets on the remaining sharp corners of the extrude. <br/>

<img width="500" alt="example" src="https://github.com/user-attachments/assets/31aef77f-5f46-48ad-871c-3368543b9fee" />
<img width="500" alt="image" src="https://github.com/user-attachments/assets/2eecff2e-6543-4e92-b47c-f9304a1a9990" /> <br/>


The two fillets on the top of the rectangle led to the top being rounded and circular, while the remaining bottom fillet connected and smoothened everything out into a nice, curvy shape! <br/>

**BUT BE WARNED!!!** The fillet/chamfer tool can also be the source of many headaches and pain! Fusion will typically not allow fillets if a certain part of an extrusion is too small or is destroyed when a fillet is applied! <br/>

<img width="500" alt="I HATE YOU FUSION" src="https://github.com/user-attachments/assets/ec9c4ad6-3ae2-47a4-9473-905e1a8e40a3" />

## Method 2: Create Form
This method is more obscure and difficult than using fillets/chamfers, but can also yeild great results if used correctly! <br/>

<img width="800" alt="image" src="https://github.com/user-attachments/assets/c7a33e14-e5c2-42d2-a0b4-2984179c0f98" />

**Create Form** is a feature in Fusion 360 that allows users to create objects called **"Forms"**. These forms are different than normal bodies, and are instead made up of faces, edges, and points, as seen in the graphic below. Create Form offers a new set of tool, but users will most likely be using the **Edit Form** tool, which allows users to move and rotate individual vertices, edges, and faces to morph the form to their liking. <br/>

<img width="700" alt="image" src="https://github.com/user-attachments/assets/4571d296-b006-40bd-9855-f75ca7971054" /> <br/>

Create form is best used on **organic or irregular shapes** that are often extremely hard to recreate with the standard extrude/loft/sweep of regular CAD. For example, I used Create Form to make a seat as part of a chair project for school, which allowed me to make a unique and comfortable shape for the seat. <br/>

The use of Create Form also allowed me to *easily change the geometry* of the seat with the Edit Form tool. While regular extrusions require going back to the sketch and changing dimensions, Forms can be directly morphed by dragging and rotating vertices and lines, making Forms much easier to work with when dealing with complex, irregular shapes. <br/>
> btw for those curious, the seat was made out of a Form cube with two of the main faces removed, then was morphed around with Edit Form to resemble a chair. <br/>

<img width="324" alt="image" src="https://github.com/user-attachments/assets/450bf74c-bd9c-4815-8f00-c5a101d1ca41" /> <br/>

**However, Edit Form isn't limited to just complex shapes!** You can easily get away with spamming simple shapes if your design needs it, such as in the case of my shrimp chef. <br/>
In this example, I used Edit Form to repeatedly place spheres to create the eyes and chef hat! While this may seem inefficient at first, making each of these spheres individually with the Revolve command would take much, ***much*** longer! <br/>

<img width="500" alt="image" src="https://github.com/user-attachments/assets/ab8456b0-264c-4411-8aa1-ea9a8e614cfa" />

