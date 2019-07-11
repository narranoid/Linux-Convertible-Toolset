# About:
# Rotates the screen and switches display keyboard layout to match 
# either portrait or landscape.

# Parameters:
# $1 => The direction to rotate to (normal, inverted, left, right)
# $2 => The output display to be rotated
# $3 => The digitizer to be rotated (lookup xinput devices to find it)



#!/bin/bash

keyboardlayout='landscape'
digitizer=$3
output=$2
rotation=$1

# rotate display
xrandr --output $output --rotate $rotation

# rotate input digitizer
case "$rotation" in
    normal)
      xinput set-prop "$digitizer" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
      ;;
    inverted)
      xinput set-prop "$digitizer" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
      ;;
    left)
      xinput set-prop "$digitizer" "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	  keyboardlayout='portrait'
      ;;
    right)
      xinput set-prop "$digitizer" "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	  keyboardlayout='portrait'
      ;;
esac

# rotate/switch display keyboard
gsettings set org.gnome.shell.keyboard keyboard-type $keyboardlayout
