#!/bin/bash

# Check if external monitor is connected
if hyprctl monitors | grep -q "HDMI-A-2"; then
    # External monitor connected - disable laptop screen
    hyprctl eval 'hl.monitor({ output = "eDP-1", disabled = true })'
else
    # No external monitor - enable laptop screen
    hyprctl eval 'hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = 1, disabled = false })'
fi
