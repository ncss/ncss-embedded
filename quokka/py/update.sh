#!/bin/bash

# Copies a file to the quokka as main.py.
# e.g.   ./update.sh demos/buttons-display-neopixels.py
# After copying everything, it connects the serial console so you can Ctrl-C/Ctrl-D.

# Disable connecting the serial console with -n

# For ongoing development, the workflow is to set up three terminals:
# 1. screen /dev/ttyACM0 115200
# 2. editor (e.g. path-to-my-program.py)
# 3. ./update.sh -n path-to-my-program.py
# Then for every update, run #3, then in #1:
#   - Ctrl-C (to stop current program)
#   - Ctrl-D (to force filesystem reload and start the new program)

CP=cp

# Check if we are on a mac
if [ `uname` = "Darwin" ]; then
    VOL_DIR="Volumes"
    OSX=1
    # Disable copying extended attributes.
    CP="cp -X"
else
    VOL_DIR="media"
    OSX=0
fi

# If using an SD card with your quokka, update this volume name
VOL_NAME="PYBFLASH"

CONNECT_SERIAL=1
# If the -n flag is given, remember to skip the serial console
if [ "$1" = "-n" ]; then
    CONNECT_SERIAL=0
    shift
fi

# If there is no argument given, copy main.py, otherwise copy the named demo
if [ $# -eq 0 ]; then
    $CP main.py /$VOL_DIR/$VOL_NAME/main.py
else
    # Copy the argument onto the board
    $CP ${1} /$VOL_DIR/$VOL_NAME/main.py
fi
sync

if [ $CONNECT_SERIAL -eq 1 ]; then
    if [ $OSX -eq 0 ]; then
        screen /dev/ttyACM0 115200
    else
        screen $(ls /dev/tty.usbmodem* | head -n1) 115200
    fi
fi
