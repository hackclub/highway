# Markdown Files

Written by: @Taran The Idiot
---

Hello! Here I will be teaching you how to write nice looking Readmes and Journals and how to use .md files.\
This is different from the How To Ship tutorial in that this shows you how to write in markdowns whereas the other one teaches you how to properly ship your project.

## Basics

First we go over the basic things you need to know when making a markdown

### Titles

---
Titles separate large chunks of text into sections.\
Sure you can just make these the size of a normal line but that doesnt really do an effective job at separation, especially when some titles are more important than others.

To add a title to your Markdown, put a hashtag before the title.\
It should look like this: `# title`\
Make sure there is a space between the hashtag and title, otherwise it will look like\
#title\
which is not what you want.

To add stuff like subheadings, add more hashtags.\
`## h2` `### h3` and so on and so forth.

Its pretty easy once you get the hang of it.



### New Lines

---
You cant just press the enter key to start a new line in a markdown.\
You need to use these things called backward slashes. Its like a forward slash, but backwards.

```
hi\
how are you?
```
This is what it looks like to use a backward slash.\
You should still press enter between lines so its easier to read when editing.\
The Backward Slash can be found above the enter button.

If you dont put back slashes, your sentences would look like this:\
hi
how are you?
I am great thanks!

#### Paragraph breaks

To create a break for a paragraph you just press enter twice\
```
hi

How are you?
```
You dont put a backward slash on the last line of a paragraph, it wont do anything and you will be able to see the slash in the markdown.


### Lists

---
Lists are useful for things like BOMs, checklists, etc

#### Normal Lists
```
- lists look like this
- use dashes and a space to make lists
- no need to use \ here
```
- it looks like this if you do it right
- lists are really nice for organising things


#### Numbered Lists
```
1. Numbered Lists are similar to normal lists
2. instead of - you use x.
3. where x is the number
```
1. It looks like this when you do it
2. numbered lists are nice for outlining steps and other uses.


#### Check Lists
```
- [ ] Check list
- [x] its same as a normal list but with square brackets
- [ ] Make sure there is a gap between the squares
```
- [ ] They look like this
- [x] The x marks whether the box has been ticked



### Links

---
Links are useful for things like your bom or inspiration sections of your readme.\
Being able to put a hyper link without cluttering your page because its 100 characters long is really nice to have.
Format your links like so:\
` [Alt text](https://hackclub.com)`\
Alt text is the text that the link appears as.\
[it looks like this](https://hackclub.com)




## Advanced/Extra stuff



### Formatting

---
Woah, you wanna put ilalics and make your text bold, add code blocks and quotes? well look no further.



#### Italics (aka slanted text)

---
To put your text in *italics*, you need to add * to each end.\
Like so:\
`*hi*`

*This makes the text Italic.*



#### Bold (thick text)

---
To make your text **bold**, add ** to each end.\
Like so:\
`**hi**`

**This makes your text bold**



#### Line breaks

---
Line breaks can be added with `---`
---
Looks like that^

Any line directly above a break will become a title, put a line space between to make it not happen

---



#### Code Blocks

---
You have seen throughout this guide where I add the raw code and the places I put it look different.\
How do I do this?\
Through codeblocks.

To use a code block, put `s on either end of the line.\
Like so:
``hi``

```
You can find this above the tab button
It is not an apostrophe
```

To add a big block of code that takes up multiple lines like above, use ``` on the line above and line below\
Like so:
~~~
```
hi
You can write multiple lines of code here
its good for showing snippets of code
```
~~~

You can use ~ instead of ` but I find the second one easier to use.



#### Quotes

---
To add a quote, use > in front of the line with a space.\
`> There are weirdos in every breed`

> This makes the text look like this

That should be everything you need to know about markdowns.\
If you feel I have missed something or want to add something yourself, dm `@Taran The Idiot` on slack or make a pr to add it.
