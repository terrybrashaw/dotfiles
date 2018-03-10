#!/bin/bash

# Set mouse acceleration <acceleration> <is_linear>
xinput --set-prop "Logitech G400s Optical Gaming Mouse" "libinput Accel Profile Enabled" 0, 1

# Set the mouse sensitivity
xinput --set-prop "Logitech G400s Optical Gaming Mouse" "libinput Accel Speed" 0.0
# xinput --set-prop "Logitech G400s Optical Gaming Mouse" "Coordinate Transformation Matrix" 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0

# Set the keyboard repeat rate.
# Usage: xset r rate <repeat delay in miliseconds> <repeat rate in keys/sec>`
xset r rate 250 35

# Remap keyboard bindings.
setxkbmap -layout us -option caps:super  

# Set monitor settings.
## Color profile
xcalib -d :0 /home/terry/.color/asus_mg279q.icc
## Set the DPI for the Asus MG279Q monitors.
## The DPI is calculated as: sqrt(horizontal_pixels^2 + vertical_pixels^2) / sqrt(horizontal_inches^2 + vertical_inches^2)
## So, for the MG279Q this would be sqrt(2560^2 + 1440^2) / 27" = 108.78
xrandr --dpi 109
