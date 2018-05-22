#!/bin/sh

# Get out of town if something errors
set -e

DP_1_STATUS=$(cat /sys/class/drm/card0/card0-DP-1/status)  
DP_2_STATUS=$(cat /sys/class/drm/card0/card0-DP-2/status)

echo "${DP_1_STATUS}"
echo "${DP_2_STATUS}"

if [ "connected" = "${DP_1_STATUS}" ]; then  
    /usr/bin/xrandr --output DP-1 --above eDP-1 --auto
    /usr/bin/xrandr --output DP-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DP-1 plugged in"
elif [ "connected" = "${DP_2_STATUS}" ]; then  
    /usr/bin/xrandr --output DP-1 --off
    /usr/bin/xrandr --output DP-2 --above eDP-1 --auto
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "DP-2 plugged in"
else  
    /usr/bin/xrandr --output DP-1 --off
    /usr/bin/xrandr --output DP-2 --off
    /usr/bin/notify-send --urgency=low -t 5000 "Graphics Update" "External monitor disconnected"    
    exit
fi
