# EasyEDA 2 KiCad Guide!!!

A lot of us probably went through the pain of using EasyEDA when starting pcb designing. It's a free and espcially easy to use tool, but it gets really annoying with performance and ux very quickly... But even though it has a lot of issues, a switch to KiCad seemed impossible due to EasyEDA's immense library of components and the fact that KiCad's library is not as extensive. But in _this guide_, I'll try to show you how to get the best of both worlds and use EasyEDA's libraries in KiCad!!!

## Step 1: Instaling the EasyEDA2Kicad script

(You need python3 for this to work :pf:)

1. Just install it with pip!
    ```bash
    pip install easyeda2kicad
    ```

_Note: You might use `pip3` instead of `pip` if you have both python2 and python3 installed._

2. If you didn't do this already, you need to add python's `bin` directory to your PATH.The path is usually something like this:
    - On MacOS :
    Add this to your `~/.bashrc` or `~/.zshrc`:
    ```bash
    export PATH="$PATH:$HOME/Library/Python/<version|3.9 for me>/bin/easyeda2kicad
    ```
    - On Linux:
    Add this to your `~/.bashrc` or `~/.zshrc`:
    ```bash
    export PATH="$PATH:$HOME/.local/bin/easyeda2kicad"
    ```
    - On Windows:
    Add this to your `PATH` environment variable:
    ```
    C:\Users\<username>\AppData\Roaming\Python\Python<version|3.9 for me>\Scripts
    ```

3. Restart your terminal to apply the changes!!

## Step 2: Adding the generated librairies to KiCad

1. In Kicad, go to `Preferences` > `Configure Paths...` and set the `EASYEDA2KICAD` variable to the path to:
    - On MacOS: `/Users/<username>/Documents/Kicad/easyeda2kicad`
    - On Linux: `/home/<username>/Documents/Kicad/easyeda2kicad`
    - On Windows: `C:\Users\<username>\Documents\Kicad\easyeda2kicad`

2. Now, go to your schematic editor, and click on `Preferences` > `Manage Symbol Libraries...`. Then, click on the `+`icon to add a new library. Its name should be `easyeda2kicad`, and the path should be set to: `${EASYEDA2KICAD}/easyeda2kicad.kicad_sym`

3. Now, go to your PCB editor, and click on `Preferences` > `Manage Footprint Libraries...`. Then, click on the `+` icon to add a new library. Its name should be `easyeda2kicad`, and the path should be set to: `${EASYEDA2KICAD}/easyeda2kicad.pretty`

## Step 3: Bleh

Now that you have everything set up, you can use the script to get all of the footprints/symbols/3d models of your favorite components from EasyEDA!
Just some quick warnings:
- Some components might have a cluttered/broken footprint;
- Some components might not have a 3d model;
- Some components might already exist in KiCad's library!
So before you use this script, try to search for the component in KiCad's library first or even design your own symbol/footprint! (a guide soon fs)

## Step 4: Using the script!!!

So now that you have everything set up, you can grab the id of your favourite component and run the
script like this:
```bash
easyeda2kicad --full --lcsc_id=<ur id here>
```
_Note this will download the symbol, footprint and 3d model of the component with the specified id! if you don't need everything just specify --symbol, --footprint or --3dmodel instead of --full!_

But uh you're maybe going to ask: "How do I get the id of the super shiny component I just found?". Well it's simple! Once you found the component on LCSC, just copy the field shown on the image below:

<img src="https://files.catbox.moe/3nolx5.png" width="600" alt="lcsc id">
