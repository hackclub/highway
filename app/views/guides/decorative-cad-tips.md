# Decorative CAD

*Written by @egg_splats on slack* <br/>
[check out my project!!!](https://github.com/hunkegg/biblicallyaccuratekeyboard) <br/>

This is less of a *guide* per se, and more so a collection of CAD techniques used to make the decorative aspects of my previous and Highway projects. <br/>
![banner](https://github.com/user-attachments/assets/2908fd2c-f4b4-4bb6-90bb-b1bd5206d71c)
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
The Construct Tools in Fusion are a set of tools that allow the user to create objects to base sketches or commands off of. While they may seem useless at first, they can be extremely helpful in making more custom and cooler designs! <br/>
![construct tools](https://github.com/user-attachments/assets/a59da974-a9f5-49fd-baa5-106cce42e248)

For example, in my Highway project, I could've copy and pasted a keyswitch section 8 times and moved them around to form a ring, but I instead used the Construct tool **"Axis Perpendicular to a Face at Point"** in combination with a sketch to create an axis of rotation to use a Circular Pattern. (i know that sounds like jargon but i'll try my best to break it down) <br/>

Essentially, the Circular Pattern tool allows me to copy a part in Fusion around in a circle, and requires an axis to rotate around. First, I drew a sketch on the part to find the "center" of the ring, then created an axis through that point with the Construct tool. Since that axis is exactly in the center of the ring, I can use that axis for my Circular Pattern, making the process **MUCH** easier and faster.
![axis tool example](https://github.com/user-attachments/assets/c9a08d54-061c-411d-8ec6-17604a5a10e4)

Construct tools often feed or help with other tools, such as **Offset Plane** or **Plane at Angle** helping with *custom angles in sketches*, or the **Axis** tools helping with Pattern-type tools like *Rectangular/Circular Pattern* as mentioned above. I ***strongly*** recommend learning these if you want to improve your modeling! <br/>
> offset plane is my favorite btw, super good for the loft tool!

### 2) Learn more Fusion tools!
While *Extrude* may get you by 80% of the time in CAD, learning other tools can help spice up your design! I ***strongly*** recommend getting familiar with the 4 tools mentioned below! <br/>
![the fantastic fusion four](https://github.com/user-attachments/assets/09390a8c-bb24-40b8-9be3-7ed394c72140)
| tool name | purpose |
| --------- | --------- |
| extrude | the basic extrude; extends a sketch perpendicular to the sketch plane |
| revolve | revolves a sketch around an axis; good for objects like vases or bottles |
| sweep | extends a sketch along a custom path (often another sketch perpendicular to the other sketch plane); good for pipes or tubes |
| loft | connects the edges between two sketches; good for adapters or in my case, keycaps! | <br/>
![loft example](https://github.com/user-attachments/assets/09380cb1-fe62-4bfb-9561-9b6d1e5486e6)
> an example of loft in action! I used **Offset Plane** to create the other sketch, then used loft to create the general shape of the keycap

Here is a list of other Fusion tools I recommend learning:
| tool name | purpose | location |
| --------- | --------- | --------- |
| Project | used in sketches, projects a 3D object onto a sketch plane. ***VERY*** helpful in designing screw holes for PCBs or for making correct sizings for other parts like keycap stems. | Sketch Tab (shows up when making a sketch) > Create Tools > Project/Include > Project (keybind should be **P** by default) |
| New Component | used to store components in CAD. helpful for organizing models with a million imported components like my keyboard. | Solid Tab > Assemble > New Component |
| Appearance | used to add materials and colors to bodies in your model. helpful for visualizing the final result, as well as making the CAD pictures for submission look pretty :D | Solid Tab > Modify > Appearance (keybind should be **A** by default) |
| Constraints | used in sketches, constrains certain elements like lines or points into a "relationship" (equal length (equal), at the same point (coincident), perfectly horizontal/vertical, etc.). **Very** helpful for designing geometric or precise sketches like the mount and casing of a PCB. | Sketch Tab > Constraints (symbols with red lines!) |
| Canvas | used to add a picture on a surface as reference for modeling. ***VERY*** helpful for designing decoration, such as the eyes on my keycaps/center, since you can just trace the canvas without issue. | Solid Tab > Insert > Canvas |
> note: "Tab" refers to the sections right above the tool icons (Solid, Surface, Mesh, Sheet Metal, Plastic, Utilities, Manage)
![canvas tool example](https://github.com/user-attachments/assets/27871e51-3416-4d04-8804-1c5e986fa4d7)
> examples of using the Canvas tool to design the decorative eyes!

### 3) Get a "Theme"
Having a theme around your project can help A TON when it comes to decoration/design, especially in the early stages of a project. <br/>
* Themes give plenty of references and inspiration, which helps against making a boring old block with rounded edges then figuring out how to make it "polished". For example, when I was designing the initial designs and prototypes of my Biblically Accurate Keyboard, I looked up pictures of angels and found reference images of angels with loads of eyes and rings, which guided my CAD towards that direction. Getting a theme, then finding inspiration online though Google or Pinterest is a **HUGE** part of designing!
> tip: filter out ai images/results; the images they generate are ugly or cliche 99.99% of the time

Here are a couple themes I personally like! <br/>

![styles i like](https://github.com/user-attachments/assets/214b433c-f29d-4891-a6c9-340882727de7)

If all else fails, think of something goofy!


## Method 1: Fillet/Chamfer
This is by far the simplest way to make something that looks nice. <br/>

I used fillets extensively in my custom keycaps and eye, where I needed to replicate an organic-like shape. Sharp angles are typically not seen in nature, and are often used in more modern/futuristic or man-made designs, such as my toy truck bumper attachment I made for a school assignment. While both can be used interchangably in a simple design, such as making a macropad look a tiny bit better, knowing where to put fillets and chamfers can make a pretty noticable difference.<br/>

![sugarcoat](https://github.com/user-attachments/assets/7b6fe0be-bad8-4f8e-b40e-7120ec88d44c)

### rounding extrusions!
While fillets are typically used to only round down external edges, the fillet and chamfer command can actually do much more! For example, fillets can round out interior edges, such as the intersection of the bottom and wall of a box. <br/>

![rounding 1](https://github.com/user-attachments/assets/c1400559-1edc-4ed0-9c31-2006b86eda6f)

Furthermore, the radius of the fillet can extend much further than the height of the wall/floor, allowing for fillets that are "more than 90 degrees" in a sense. <br/>

![rounding2](https://github.com/user-attachments/assets/bcbd3721-a113-4dbf-9d6b-0ea8dad93bbb)

The combination of this technique, as well as some regular fillets are what allowed me to create the unique geometry of the eyes found on the center of my Highway project. The eyelids first started as a regular and boxy extrude, then was blended into the face of the center with an extended fillet, then rounded off by placing more fillets on the remaining sharp corners of the extrude. <br/>

![rounding example](https://github.com/user-attachments/assets/c621877c-bb67-49d5-a7f8-6b8d5f49193a)

The two fillets on the top of the rectangle led to the top being rounded and circular, while the remaining bottom fillet connected and smoothened everything out into a nice, curvy shape! <br/>

**BUT BE WARNED!!!** The fillet/chamfer tool can also be the source of many headaches and pain! Fusion will typically not allow fillets if a certain part of an extrusion is too small or is destroyed when a fillet is applied! <br/>

![I HATE YOU FILLETS](https://github.com/user-attachments/assets/6bc1eefc-68f2-4b29-b177-90da8c043d9c)

## Method 2: Create Form
This method is more obscure and difficult than using fillets/chamfers, but can also yield great results if used correctly! <br/>

![create form](https://github.com/user-attachments/assets/68c9061f-5afc-48ec-b48a-30fbd47ae6d3)

**Create Form** is a feature in Fusion 360 that allows users to create objects called **"Forms"**. These forms are different than normal bodies, and are instead made up of faces, edges, and points, as seen in the graphic below. Create Form offers a new set of tool, but users will most likely be using the **Edit Form** tool, which allows users to move and rotate individual vertices, edges, and faces to morph the form to their liking. <br/>

![forms](https://github.com/user-attachments/assets/39e4c173-0769-45ac-9f8e-a689bcde15c0)

Create form is best used on **organic or irregular shapes** that are often extremely hard to recreate with the standard extrude/loft/sweep of regular CAD. For example, I used Create Form to make a seat as part of a chair project for school, which allowed me to make a unique and comfortable shape for the seat. <br/>

The use of Create Form also allowed me to *easily change the geometry* of the seat with the Edit Form tool. While regular extrusions require going back to the sketch and changing dimensions, Forms can be directly morphed by dragging and rotating vertices and lines, making Forms much easier to work with when dealing with complex, irregular shapes. <br/>
> btw for those curious, the seat was made out of a Form cube with two of the main faces removed, then was morphed around with Edit Form to resemble a chair. <br/>

![chair example](https://github.com/user-attachments/assets/028c1af0-476d-4a51-9744-4c2df5d952a9)

**However, Edit Form isn't limited to just complex shapes!** You can easily get away with spamming simple shapes if your design needs it, such as in the case of my shrimp chef. <br/>
In this example, I used Edit Form to repeatedly place spheres to create the eyes and chef hat! While this may seem inefficient at first, making each of these spheres individually with the Revolve command would take much, ***much*** longer! <br/>

![shrimp example](https://github.com/user-attachments/assets/c17b23a7-f867-4413-a3a6-1f2ebd347efb)


