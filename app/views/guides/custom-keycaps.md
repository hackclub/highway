# Custom Keycaps
### Ever wanted to spice up your keyboard/Hackpad/fidget toy/where ever you have a keyboard switch?
Try making your own custom keycaps! <br/>
This short guide will go over my process of making **custom keycaps** for my Highway projects (as well as going over some handy CAD commands)
> encoder knob tutorial also included at the end :3 <br/>

> guide by @egg_splats! check out my other keyboard-related projects, [the Biblically Accurate Keyboard](https://github.com/hunkegg/biblicallyaccuratekeyboard) and [the Engipad](https://github.com/hunkegg/engipad) <br/>
> 
> FYI, this guide will be using Fusion 360! this guide will also be modeling keycaps for standard MX switches (no low-profile switches, but feel free to take notes/inspiration!)

## ...but why?
Custom keycaps are a nice way to add some personal flair and ***✩ polish ✩*** to your keyboard projects aside from the case and PCB. They can be placed anywhere, such as the escape key on a 75% keyboard or on a macro-binded key on a deskside macropad. <br/>
Custom keycaps can also help with making a **certain theme** more cohesive and "complete", such as the custom keycaps with eyes on my biblically accurate keyboard!
![theming is everything](https://github.com/user-attachments/assets/8b4e52b9-a6bb-40e6-8831-d9e603d32bfa)

## ok how do i start
First, open up your CAD software of choice and create a sketch on the bottom plane. <br/>

Next, you're going to make the bottom face of your keycap. <br/>

Most MX-compatable keycaps use bottom dimensions no bigger than **18mm x 18mm**, so we will be using that as well! Go to the "Create" section of the toolbar and select the Rectangle tool. You can use any of the three rectangle tools, but I personally prefer **Center Rectangle** to keep things centered around the origin. <br/>

Next, draw a rectangle with **18mm x 18mm** dimensions. You can do this while drawing the rectangle by typing in the numbers and using Tab to switch between side dimensions, or use the **Dimensions** tool by clicking D, then clicking on the sides of the drawn rectangle.

![rectangle](https://github.com/user-attachments/assets/15b70d22-7618-4de3-a63d-14bf2951b6fc)

We will also be adding a fillet to the corners of this profile, since a pointy square honestly looks *pretty ugly* <br/>
To do this, click on the **Fillet** tool, then click on two touching sides of the square to make a rounded corner, also called a fillet! I used 2mm as the radius, but the choice is up to you! <br/>

![fillets](https://github.com/user-attachments/assets/a2673334-2ae0-403b-9f2c-3880e932e679)

After you have your base, click "Finish Sketch"! Once we do this, we should have a 18mm x 18mm square sketch with rounded corners. <br/>

![rounded rectangle sketch](https://github.com/user-attachments/assets/ae495a99-a563-4c62-a017-38c8bf9e78a7)

We will be using the **Loft** tool to create the general shape of the keycap. This tool essentially connects two sketch profiles that are on different planes by making a smooth transition between the two profiles. <br/>

![lofty lofty](https://github.com/user-attachments/assets/fb66b0c1-bf00-41c3-b4c7-2ee5e34f3634)

When you look at a regular keycap, you'll typically see the keycap *taper*, or get smaller, near the top. To mimic this shape, we will be using the **Loft** tool alongside a smaller sketch profile to create the shape of the keycap. <br/>

However, to first do this, we need a new plane to make our sketch on! This can be easily done by using the **Offset Plane** Construction tool! As the name implies, this tool makes a new plane to draw sketches on that is *offset*, or extended from, from the original plane. <br/>

To make our new and shiny plane, select the **Offset Plane** tool under Construction and click on the square sketch as our plane. Then, drag the arrow up and down to adjust the height of the plane. <br/>
We will be using 10mm for now! Keycap height varies, but most non-low profile caps are around the ~9-10mm range. <br/>

![offset plane](https://github.com/user-attachments/assets/2f4a3711-ddf7-431b-8fe9-30a79e9636ff)

Once we have our plane, select "OK". <br/>

Now that we have our plane, we can make our second sketch required for the Loft! Select the Sketch tool and the newly created plane to create a new sketch on the plane. <br/>
From here, there are many ways to approach making the top profile. Due to the simplicity of the model, we can get away with using a regular old rectangle or circle as our top profile. <br/>
> (I'll get into my own preferred method involving my goat later in the guide :3) <br/>

To make a top profile, draw a circle or rectangle on the sketch plane. The position can vary depending on your preference, but for the sake of the guide, we will be centering the shape on the origin. Set the shape to 15mm on each side or in diameter and click "Finish Sketch".

![corcle](https://github.com/user-attachments/assets/9b2eece7-a267-484e-b585-7edc089f7fc3)

Once we do that, we should have two sketch different sketch profiles that look like this:

![ready to loft sir](https://github.com/user-attachments/assets/9cf6d298-0ea9-4171-92a3-71c14c0e6c51)

Now, we can use Loft to make our keycap! Select **Loft** under Create, then click on the two sketch profiles. Once we do that, click "OK" to create the body.

![we have loft off we have a loft off](https://github.com/user-attachments/assets/8591a956-f56d-4f3a-b5c9-31f0e061b962)

We now have the general shape of our keycap, but currently it's COMPLETELY solid <br/>

However, we can fix that by using the **Shell** Command! This command essentially hollows out a solid with an opening, using a specified wall thickness and a selected face as the opening. Almost all keycaps have an opening on the bottom, so for the Shell command, we will be selecting the bottom face of the solid with the wall thickness set to 1mm.

![shellcommand](https://github.com/user-attachments/assets/e1961256-24fe-443d-b0f1-73947f22afe6)

This should result in our keycap having a large opening in the bottom! <br/>

We now have an opening, but if we were to print this out and slap it onto a switch, it wouldn't stay on for long... <br/>
This is because there is no feature to hold the switches' *stem*, or the plus-shaped bit poking out that is pressed! <br/>

To do this, we can make a new sketch in the inside of the keycap! Select the bottom side of the hollowed-out keycap as shown, and create a sketch.

![new sketch](https://github.com/user-attachments/assets/b8b73772-edd3-44f0-ad89-9b89acfee1fd)

From here, the story changes. Cherry switches have a plus-shaped stem that's 4mm long and 1.17mm wide, but other brands of switches have their own dimensions. It's up to you to do research on the dimensions! <br/>

![dimensions](https://github.com/user-attachments/assets/65f7f9e4-1088-48c7-9ba0-d774039dbb0f)

For this tutorial, I will use the dimensions shown in the image above, as well as a stem diameter of 5.5mm. <br/>
First, start with a circle with diameter 5.5mm centered at the origin (this should also be the center of the keycap if you centered the loft profiles on the origin!)

![circl](https://github.com/user-attachments/assets/768d96cf-456c-4cca-a801-b191f25e966d)

Next, use the Rectangle tool to draw out the plus shape of the stem, making sure the rectangles are dimensioned correctly to your keyswitch (I recommend using *Center Rectangle* here!)

![stem](https://github.com/user-attachments/assets/8f7c570f-8b56-4ec3-a96d-2ddc506f0d14)

Once you have that, finish the sketch and extrude the circle (EXCLUDING THE RECTANGLES!) downwards. The length of the extrusion depends once again on your switch, but 6-8mm tends to work out for me.

![extrude](https://github.com/user-attachments/assets/c8b52d8c-f7ee-4577-9730-00aecc98640d)

Once you finish that extrusion, your switch should *nearly* be done! Go ahead and gawk in amazement! <br/>

![wow finished!!](https://github.com/user-attachments/assets/4a40f7b4-f7ac-4386-b3e2-f391f7a77051)

*But this is only the easy part...*

## Customization
You have a nice looking custom keycap, but to make it *truly* custom and ***✩ polished ✩***, you have to add some flair to it! This can range from adding some fillets and text to the top, to adding completely new models to the keycap or changing the entire shape of it! <br/>

For example, our current keycap has a pretty sharp edge on the top, which may look ugly to some people. To fix this, we can add a fillet or chamfer by simply clicking on the edge or face and using the **Fillet/Chamfer** tools, as seen below. <br/>

![roundy](https://github.com/user-attachments/assets/1c9b1532-09e5-44dd-ac6d-be069f9e5a22)

Although this is nice, the keycap is still pretty bland... What's the use of a *custom* keycap if there's *no* text, art, or anything special? <br/>

...So let's do that! <br/>

To add text, create a new sketch on the top of the keycap and use the **Text** tool under the Create menu to add text to the sketch, making sure it fits onto the keycap! Once you have that, select the blue text and Extrude it! <br/>
Direction doesn't matter, but be aware of the keycap's thickness if you cut into the top like I did below. Go too deep into the keycap, and suddenly you're cutting into the stem and ruining the model!

![:3](https://github.com/user-attachments/assets/695c20a5-bae4-4a57-8d64-c558f047b044)
![examples!](https://github.com/user-attachments/assets/fba91505-9aaf-4bc1-8a54-1759d02e59df)

Additionally, you can go a step further and draw on the keycap! By using the **Canvas** tool, you can make a reference image to trace over, such as in the example of the eyes on my keycaps for the biblically accurate keyboard!

![eyecap](https://github.com/user-attachments/assets/502e1607-18e3-4c9f-b2ed-890877259ac8)

To add a canvas, go to Insert and click on the photograph icon named **Canvas**. After that, you can trace over it with any tool in the Sketch menu. <br/>
The most common tool to trace with is with the **Fit Point Spline** tool, which automatically curves a line depending on the points specified. Other tools like lines, polygons, and circles can also be used, but typically depends on the design you're aiming for.

![splines](https://github.com/user-attachments/assets/57ecd68b-97ac-4dbf-aba6-b88dce6e450a)

**but THAT'S STILL BORING!!** What if you want a custom shape like the keycaps on my Engipad? 

![engipad](https://github.com/user-attachments/assets/948fd1c4-0fa8-4b9c-89f3-f9513dedac00)

To change the shape of the keycap, you can go into **Fusion's timeline**, a bar on the bottom of the screen containing command icons like Extrude or Fillet that shows the history of your model. From here, you can change many things about the keycap! <br/>
* Do you want a differently sized base? Maybe you want chamfers? Go into the first sketch and change the shape and update the loft (or any features that break/need to be updated)!
* Do you want a taller/shorter keycap? Go into the **Offset Plane** and adjust the height! make it 1,000,000 millimeters tall i dont care
* Do you want a differently shaped top? Go into the second sketch set on the offset plane and change it!
  
![shape](https://github.com/user-attachments/assets/937bc0b8-b5d6-4615-91e1-342124b70e01)

Additionally, if you already have a shape in mind, you can **preemptively** design the shape while making the keycap, leading to less errors and more control over the design, which is what I did when making my custom octogon-like keycaps for the Engiboard! <br/>

*You can do anything with custom keycaps!* <br/>

* Do you want a ***whole ass cooking wok*** on your keycap? Model a wok separately, import it into the design, position it, and combine the two bodies together! <br/>

![i took the wooooook](https://github.com/user-attachments/assets/fa53a4ec-1073-4249-b047-45fed80f3219)

* Do you want a typewriter-styled keycap with an A on it? Make a circular base, offset the 2nd profile by 6mm, make another circle, loft it, then add your text in with a border with a fillet on the inside edge! <br/>

![typewriter](https://github.com/user-attachments/assets/454c56a7-4841-484c-88c5-63837e0d097b)


## EXTRAS!!!!! (custom encoder knob!)
got my hackpad parts here and noticed that the encoders were pretty cool so heres an extra tutorial for custom knobs <br/>

I'll be using the rotary encoders that come in with the Hackpad Kit (EC11 rotary encoder from my research, don't quote me on that), along with a pair of calipers to get the measurements. If you search up the encoder you have, you can also find the dimensions there. <br/>

# ok how start
The encoder that comes with the kit is a D-shaft, meaning that the profile is a cylinder with a segment removed, making the profile look like a D. To get the proper dimensions, we have to measure the **diameter** of the shaft, the distance between the **chord** and the opposite side of the circle, and the **step distance** of the missing segment. <br/>

![dimensioning hours](https://github.com/user-attachments/assets/4e4e2d22-5129-4d8a-a61f-ca248b67da37)

Once we have the dimensions, we can start modeling! <br/>

First, create a new Workspace and create a new sketch. When you're in the sketch, recreate the profile of the D-shaft using the dimensions above! <br/>
* We can do this by first creating the outer diameter with the Circle tool, making the diameter the one we found earlier. (centering the circle on the origin helps a lot here too!)

![circles](https://github.com/user-attachments/assets/b890fa42-6785-43d5-9229-d59ae4c2203e)

* Next, we will create the beginning of our chord by drawing a line somewhere on the circle, which will cut through this circle. We will be using the **Constraint Tools** and the **Dimension Tool** to complete this sketch!

![line](https://github.com/user-attachments/assets/66c74fba-2843-40dc-aa85-515625ce4caa)

* Currently, our line can move anywhere it wants, which is bad in our case since we want everything to the right dimensions! To fix this, apply the **Horizontal/Vertical Tool**, which will constrain our chord to be perfectly horizontal no matter what!

> fun fact: Fusion can automatically apply this constraint when making a line! Just look for the Horizontal/Vertical symbol when drawing your line!

![horizontal](https://github.com/user-attachments/assets/0d75d575-e756-4c29-a794-12184aaee0c7)

* However, our line can still move up and down, which is *still* not what! To fix this, we can make a new line above the circle, applying the **Horizontal/Vertical Tool** to this line as well.
* Once we have that line, we can use **Tangent Constraint** to make the new line tangent to the outer diameter. To put this physically, this is the point of the outer diameter that was touching the calipers when we recorded the 4.5mm chord-to-diameter measurement!

![tan tan tan](https://github.com/user-attachments/assets/75afe2c3-74d0-45e6-a7c6-20a04a406de5)

* After that, use the **Dimension Tool** to make a dimension between the tangent line and the chord! This should be what you recorded for the chord-to-diameter measurement, or in our case, 4.5mm!

![measur](https://github.com/user-attachments/assets/85f93dd1-a121-491c-b723-5fad3001282a)

Once you have that, we can start working on the outside of the knob! <br/>
The knob can be customized to whatever shape or size you want, but for this tutorial, we will be using a standard circle. <br/>

To make the knob, make a circle with the *same* center as the outer diameter of the D-shaft (can also be the origin if you centered everything on it) and dimension it to 12.5mm.

![knob size](https://github.com/user-attachments/assets/2163febe-a039-4eed-827a-01df6c51a529)

Once we have that, finish the sketch and extrude **EVERYTHING**! This should just leave us with a massive cylinder 12.5mm in diameter. <br/>
Again, the size can be customized to your liking, but I will be using 15mm for this guide.

![extrude da knob](https://github.com/user-attachments/assets/0abf4809-0410-4fb9-b2b0-9e4739a302e2)

You might be thinking to yourself that what we did with the shaft was *pointless*, since we literally just ignored it with this extrude. And while it may not be visible, we can change that by going into the **Sketches Folder** in the left-hand menu and unhiding the sketch by clicking the eye. <br/>

![unhiding](https://github.com/user-attachments/assets/faec5117-181f-46f7-804b-f0584f74a8d7)

Once we unhide the sketch, we can now reference this sketch with other tools, such as new sketches, extrude, loft, etc. We will be using this first sketch to create the hole to fit our encoder's D-shaft! <br/>
Go to the bottom of the cylinder and use the **Extrude Tool**, clicking the larger segment of the circle to select it. Once it is selected, extrude it upwards by the **step distance** we found earlier, or in our case, 10mm.

![sketch referencing aah](https://github.com/user-attachments/assets/f0211fa8-4c34-4e78-8396-df3b1ecdbf82)

When we do that, we should have a hole that will perfectly fit our rotary encoder!
Lastly, we can finish up the knob by adding a quick chamfer to the top. Rotate to the top side of the knob and use the **Chamfer** tool on the edge of the knob, setting the distance to 1 mm.

![chamfers!](https://github.com/user-attachments/assets/6513f7bb-939a-4b7c-8e93-eaec3c3b7135)

Once you do that, you're done with your knob! Go ahead and gawk once again in amazement! <br/>

### extra extra stuff (knob customization)
You can easily apply some of the techniques from the custom keycaps to the knob, such as applying custom art or text on your knob! <br/>
Here is a small list of techniques I use to customize my knobs a little more:
* When extruding the knob, you can adjust something called the **Taper Angle**, which allows you to create knobs that get smaller or bigger as you reach the top! This allows you to make some pretty unique knobs, such as a professional looking volume knob or a big and goofy knob!
* You can add some parallel knurling (the texture used to improve grip) by going into the original sketch and adding a shape along the outside diameter, then using a **Circular Pattern** to copy the shape along the entire circumference. Once you have that, go into the first extrusion and exclude the shapes to get a knurling pattern along the side of the knob!
* As always, you can add a separate model on top of the knob and merge it with the knob to make a completely custom-shaped knob! For example, I modeled up a quick valve and merged it into a shortened version of this guide's knob!
![knurling](https://github.com/user-attachments/assets/42f44aab-f38a-4807-9b3a-4ba6d8447cef)
![valve](https://github.com/user-attachments/assets/3652e7a5-42f1-4fb8-9fa7-10197d2eddf9)




