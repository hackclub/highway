# Finding Example Schematics

By: Madhav Garg

When you go design something, you are very likely to come across some part, or some item that you absolutely need, but have no way of wiring up. So now what do you do?

Well, you could go through the entire datahseet, looking for the item you need, but that can take a long time. A very, very long time. Take a look at [this datasheet](https://datasheets.raspberrypi.com/rp2350/rp2350-datasheet.pdf)!\
It has over 1300 pages!

### Stratagy 1:
You could try CTRL+F, but in such massive datasheets, it might be hard to find what you need. Just checking for the number '90' gives me over 100 entries!\
<img width="419" height="94" alt="image" src="https://github.com/user-attachments/assets/1f75ba1e-640a-4a5c-b96c-2dad59b3e2a2" />\
Now thats bad and all, but don't worry, there is hope

### Stratagy 2: Schematics

Most of the time you go look for information about a component, its because you just want the ideal schematic, and most manufactureres know that. They often put an example at somepoint of the datahsheet:

<img width="837" height="864" alt="image" src="https://github.com/user-attachments/assets/37c16000-3132-4774-b366-dd3ca8cc46c6" />

<img width="821" height="699" alt="image" src="https://github.com/user-attachments/assets/c8ad0964-0c69-4f34-bae1-e22605f4ff07" />

A protip is just to CTRL+F for "layout", "schematic" or "typical application"

### Stratagy 3: Google.

Often, if you just Google "xxx Schematic" or "xxx Example" you will get something of use. For example, the first image when I Google "RP2040 example schematic" is the following, a perfectly ok schematic!

<img width="2000" height="1414" alt="image" src="https://github.com/user-attachments/assets/b090f9a9-f0f1-4120-8c68-9afecfed9b00" />

### Stratagy 4: Adafruit.

Often, my first go to stratagy is to find a similar item on Adafruit. If that substitute chip will work, I'll just use it and adopt Adafruit's schematic.

For example, if I like their [lipo charger circuit](https://www.adafruit.com/product/4410), I can just Google the product name followed by github, and voila! you can find the schematic!

<img width="1051" height="418" alt="image" src="https://github.com/user-attachments/assets/206e823e-987c-49be-9f10-8ca742a3fe60" />

And that's all I have for you! Any questions can be directed to @madhav on slack.
