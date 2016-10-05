#!/bin/sh
xrandr \
    --output DP3 --off \
    --output DP2 --off \
    --output DP1 --off  \
    --output HDMI1 --off  \
    --output HDMI2 --off  \
    --output HDMI3 --mode 1920x1200 --left-of LVDS1 --primary \
    --output LVDS1 --mode 1600x900 --pos 0x300 \
    --output VGA1 --off
