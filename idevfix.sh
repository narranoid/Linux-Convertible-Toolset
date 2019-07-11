# Credits:
# Almost everything in this script was written by Ray H. in this 
# Ask Ubuntu answer: https://askubuntu.com/a/694551/448526
# I just made a slight improvement by filtering HID devices.

# About:
# idevfix => Input Device Fix
# Removes certain HID (human interface device) drivers and re-inserts
# them so they work again properly. This is handy if your convertible
# keyboard does not work after being in tablet mode.
# This script should take care of that.
# Tested on Acer Aspire R13 running Ubuntu 15.10.

# How to setup:
# Make this script accessible from touchscreen (e.g. with a launcher).
# Add the following line with sudo visudo and replace your-user and
# your-path-to-the-script with your user name and the path where you
# placed this script to make idevfix work without a root password.
#
# your-user ALL=(ALL) NOPASSWD: your-path-to-the-script/idevfix.sh
#
# This is required to run idevfix without root password from launcher.



#!/bin/sh

# if user is not root, rerun as root 
[ "root" != "$USER" ] && exec sudo $0 "$@"
# list all modules and remove certain hid (human interface device) modules
lsmod | grep '^[^ ]*hid' | cut -f1 -d " " | xargs -n1 rmmod
# insert all modules for any devices with no drivers present
udevadm trigger
# wait a second
sleep 1
# enable synaptics device (device with SYN1B in the name)
xinput | grep SYN1B |cut -f2 -d "=" | cut -f1 | xargs -n1 xinput --enable
