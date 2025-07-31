# How to Make Beautiful Readmes

Hello! This is Anicetus, and I'm writing this guide because I've been seeing a lot of ugly readmes out there. This guide assumes you know most of the features of Markdown, but that you haven't learned how to make it look _good_. If you're a noob to Markdown, check out [Taran's guide](https://highway.hackclub.com/guides/markdown)! For example, an ugly readme might look like this:

<sub>hehe picking on taran today</sub>

<br>
<br>
<kbd> <img width="940" alt="Ugly Readme" src="https://github.com/user-attachments/assets/bd68758e-3741-48ad-944e-81b34e5bcd3c" style="border: 2px solid grey;"/> </kbd>
<br>
<br>

_Or,_ if the author put in more effort, it could look like this:

<br>
<br>

<kbd> <img width="940" alt="Beautiful Readme" src="https://github.com/user-attachments/assets/b6705aa0-baec-45f5-89d6-5de604870c84" /> </kbd>

<br>
<br>

And after reading this guide, your readmes will start to look more like the second image.

It can be so easy to give in to temptation and just scribble out an incredibly ugly readme. Who's going to actually read it anyway?  
Nobody if it looks like _that._ Usually, it doesn't even matter the content of the readme. Obviously, if you never actually say what your project is, your work isn't worth much, but people will generally be drawn to the project that _looks_ good, even if there are plenty of amazing, high-tech projects out there but their readmes look like your 8th-grade history exams.

Many a time I've tried to look at cool projects on GitHub, interested in them and wondering how I could make one myself. But the lack of easy-to-follow documentation can be such a hurdle that I give up entirely.

## So how do I actually make good readmes?

Oh, by the way, you can see all the methods I'm using to make this Markdown file by viewing it raw!

### 1. Images

Well, if you look at the pictures above, what's the first difference you notice? If you're like me, it's that the second has a picture of the finished product. They say a picture is worth a thousand words but a picture is far more interesting than any thousand words you could write. Looking at the picture of your project is much easier on the reader than trying to decipher what it might look like simply from text.

Pictures also lighten up an area that might otherwise be dominated by text. Nobody's interested in reading 400-word paragraphs back-to-back. Images, especially colorful ones, can provide a bit of vibrancy in a sea of words and numbers. As you can see from the second picture, there are two little "badges" underneath the main image. These (which can be generated [here](https://shields.io) in case you're curious) help lighten up the mundane black-and-white GitHub webpage with some blues and reds.

If you really want to lighten stuff up, add a gif! GitHub Flavored Markdown supports it.

<img src="https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbjJ6bXJ0emVheXoxdGw5b2Y5Mm8xNWFka3kxemc3Zjk3NHo4MHpuaCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o7aCPLAT9ZbS4VBHa/giphy.gif" width="25%" alt="Yes... maybe... yes... yes... yes... yes... NO!!"/>

### 2. How to Use Headers (like this one!)

Markdown supports a bunch of header sizes, but the only ones basically anybody uses are H1, H2, H3, and maybe H4. Here's what they look like:

<img width="914" alt="image" src="https://github.com/user-attachments/assets/05239ea4-7432-4f58-99d5-ed817a711390" />

H4 and smaller are really just excuses to be able to link to a particular part of a page, since you can get the same results just by bolding text.

You have to be careful, however, not to use headers too often. If you have sections of a readme that are quite small but need headers, consider using a smaller size, or simply adding more content between them. Having three H1 headers, each with a single sentence between them, will look lopsided and cluttered. But the more space you put between them, the more that big-small-big-small rhythm is smoothed out.

### 3. Smol sections

Sometimes, when you have long paragraphs and maybe lengthy header names, you'll have text (and images too!) that stretch to the far right of the screen. This creates a block-like feeling, which can feel claustrophobic and tight. An easy way to break this up is to have things like lists and tables. Observe:

<kbd> <img width="826" alt="image" src="https://github.com/user-attachments/assets/6635ff72-8e63-4338-954c-a7c0b59941df" /> </kbd>

As you can see, that was a giant block of text broken up by a helpful list.

Not only are lists and tables easy ways to review information and to provide a quick reference, but they're extremely useful in helping keep readmes free and smooth-flowing. Smaller images and even short headers can achieve the same thing. Some ideas:

* A table of contents
* A review list
* A suggestion list (like this one!)
* A Bill of Materials
* A funny gif (like the one above)
* Comparing data between two things

### 4. Text Styling

Just about everybody knows what italics and bold are, but hardly _anybody_ actually uses them. They're great for providing emphasis on certain parts of a sentence, and that emphasis can take away the dull, monotonous feel that a lot of readmes have. Which do you like more?

#### Example One
AC voltage is really strong and if you're not careful you can hurt yourself badly. You should use spade connectors for screw terminals, because if a wire comes loose, it can short and start a fire.

#### Example Two
AC voltage is _**really**_ strong and if you're not careful you can hurt yourself badly. You should use _spade connectors_ for screw terminals, because if a wire comes loose, it can short and _**start a fire.**_

At least when reading them out loud, the second example definitely puts more weight into the danger of carelessly handling AC voltage. Now, you probably won't use italics and bolding as often as the second example did, (in fact, overusing them can turn monotonous text into painfully emphatic text) but when writing parts you want the readers to really _get,_ it's a good idea to italicize it.

Another part of text styling that I personally enjoy is subscripting. Most Markdown processors accept HTML tags embedded in them, such as `<div></div>` and `<p></p>`, but not many people know about the `<sub></sub>` tags. If you don't know, subscripting is what's used when you see the little two in H<sub>2</sub>O. It usually isn't very helpful unless you're writing your chemistry homework in HTML, but one thing I like to use it for is little semi-offtopic comments. It's fun to use them right before a large header, so it's tiny text and then POW! big text again. I got it from [Andrew Ellis's Print Tuning Guide](https://ellis3dp.com/Print-Tuning-Guide/), where he makes funny comments using subscript. Go see if you can find some!

One thing I _don't_ recommend using is underline. It makes it look like your link failed, and most people will be confused when clicking on it doesn't take them to some website. If you have to emphasize something, I'd go with italics. If that isn't enough, italics and bold. Still not good enough? Italics, bold, _and_ surround it with fire, stopsign, red circle, and exclamation point emojis.

<sub>there is no in-between.</sub>
## The End

Hopefully that helps! If you'd like to see a project where I used these tips and tricks, check out [the Printer Pi Pro.](https://github.com/invictus-anic3tus/Printer-Pi-Pro). It utilizes many of the things described above, but I admit much of the content in this guide was thought up in the moment.

One last thing before I finish this up: if you have extensive documentation, I'd advise against putting it in the readme. Instead, make a docs folder, folders for each of your documented items, and readmes in each of those containing any information the user needs. Readmes are supposed to be relatively short and compact, and shouldn't be explaining the fourteen easy steps of exactly how to fix `ERROR: Line 32: function NobodyCares() is not defined in the current instance, or in any other ones neither`.

Well, that should be it!!!!! Cya around.  
~ Anicetus
