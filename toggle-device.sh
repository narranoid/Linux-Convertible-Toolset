# About:
# Toggles a xinput device enabled state.

# Parameters:
# $1 => Name of the device to toggle

#!/bin/bash
device=$1

# get previous state
oldstate=$(xinput list-props "$device" | grep 'Device Enabled' | rev | cut -b 1)

# toggle state
newstate=$(( "$oldstate" == "1" ? 0 : 1 )) 
xinput set-prop "$device" 'Device Enabled' "$newstate"