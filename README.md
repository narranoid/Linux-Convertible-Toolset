# Linux Convertible Tools
Contains scripts and configuration files supporting *Linux/Ubuntu* systems to deal with a convertible notebook in the *Gnome 3* desktop environment.
All features are tested with an *Acer Aspire R13* running *Ubuntu 15.10* using *Gnome 3*.
More infos on the device at the [product page](https://www.acer.com/ac/en/US/content/acerdesign-aspirer13) or on [*Wikipedia*](https://en.wikipedia.org/wiki/Acer_Aspire_laptops#Aspire_R_13).


## Keyboard Layouts
In the *layouts* folder you can find *Caribou* keyboard layouts for landscape and protrait mode. They only contain layouts for German keyboards, but you can use them as a reference to create your own. 
Paste these into your */usr/share/caribou/layouts* directory to make them available.

Each folder's name in the *layouts* folder is automatically a layout name for *Gnome*. So if you change these, you have to change the variable values in *rotate-display.sh* as well to make that script work properly. 


## Input Device Fix (idevfix)
*idevfix.sh* contains a script that reloads certain drivers of HIDs (human interface devices). This may be used to reactive devices if they were disabled by the convertible when they must not be used (e.g. the keyboard if it is covered by the display). As most convertibles are not optimized for Linux, reactivating those devices can be buggy. This script is here to help on this issue.

Make this script accessible from touchscreen (e.g. with a launcher).
Add the following line with `sudo visudo` and replace your-user and your-path-to-the-script with your user name and the path where you placed this script to make idevfix work without a root password.

`your-user ALL=(ALL) NOPASSWD: your-path-to-the-script/idevfix.sh`

This is required to run idevfix without root password from launcher.


## Display Rotation
Rotating the display can be done via Shell commands an this is what happens in *rotate-display.sh*.
It rotates the output screen and the input matrix for touch and pen input. It also switches the keyboard layout to portrait or landscape respectively.
On my *Acer Aspire R13*, the output device was called *eDP1* and the touch and pen input was called *SYNAPTICS Synaptics Touch Digitizer V04 Pen*. You may find similar devices on your computer by using the following commands:
- `xrandr -q` to list outputs
- `xinput list` to list inputs

Replace parameter 2 (output) and 3 (input) for the script accordingly to what you find there.
Parameter 1 states the direction you want to rotate to (normal, inverted, left, right).

Keep in mind that the keyboard layouts used in the script (landscape, postrait) are depending on the keyboard layout folder names in the */usr/share/caribou/layouts* directory. The layouts of this repository are named like this, so if you use these, you are fine.

Example: `./rotate-display.sh left eDP1 "SYNAPTICS Synaptics Touch Digitizer V04 Pen"`


## Toggle Device
*toggle-device.sh* is a simple script to toggle the *Device Enabled* state in *xinput* of an input device.
Use the first and only parameter to pass the name of the input device you want to toggle.
I used it for the hardware keyboard which was called *AT Translated Set 2 keyboard* in my case.
Use `xinput list` to lookup your devices.

Example: `./toggle-device.sh "AT Translated Set 2 keyboard"`
