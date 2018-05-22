#!/bin/sh

# Get out of town if something errors
# set -e

# Get info on the monitors
eDP_1_STATUS=$(cat /sys/class/drm/card0/card0-eDP-1/status)  
DP_1_STATUS=$(cat /sys/class/drm/card0/card0-DP-1/status)  
DP_2_STATUS=$(cat /sys/class/drm/card0/card0-DP-2/status)

eDP_1_ENABLED=$(cat /sys/class/drm/card0/card0-eDP-1/enabled)  
DP_1_ENABLED=$(cat /sys/class/drm/card0/card0-DP-1/enabled)  
DP_2_ENABLED=$(cat /sys/class/drm/card0/card0-DP-2/enabled)

# Check to see if our state log exists
if [ ! -f /tmp/monitor ]; then  
    touch /tmp/monitor
    STATE=5
else  
    STATE=$(cat /tmp/monitor)
fi

# The state log has the NEXT state to go to in it

# If monitors are disconnected, stay in state 1
if [ "disconnected" = "$DP_1_STATUS" -a "disconnected" = "$DP_2_STATUS" ]; then  
    STATE=1
fi

echo "${STATE}"

case $STATE in  
    1)
    # laptop monitor (eDP-1) is on, projectors not connected
    /usr/bin/xrandr --output eDP-1 --auto
    STATE=2
    ;;
    2)
    # laptop monitor (eDP-1) is on, projectors are connected but inactive
    /usr/bin/xrandr --output eDP-1 --auto --output DP-1 --off --output DP-2 --off
    STATE=3 
    ;;
    3)
    # laptop monitor (eDP-1) is off, projectors are on
    if [ "connected" = "$DP_1_STATUS" ]; then
        /usr/bin/xrandr --output eDP-1 --off --output DP-1 --auto
        TYPE="DP-1"
    elif [ "connected" = "$DP_2_STATUS" ]; then
        /usr/bin/xrandr --output DP-2 --off --output DP-2 --auto
        TYPE="DP-2"
    fi
    /usr/bin/notify-send -t 5000 --urgency=low "Graphics Update" "Switched to $TYPE"
    STATE=4
    ;;
    4)
    # laptop monitor (eDP-1) is on, projectors are mirroring
    if [ "connected" = "$DP_1_STATUS" ]; then
        /usr/bin/xrandr --output eDP-1 --auto --output DP-1 --auto
        TYPE="DP-1"
    elif [ "connected" = "$DP_2_STATUS" ]; then
        /usr/bin/xrandr --output DP-2 --auto --output DP-2 --auto
        TYPE="DP-2"
    fi
    /usr/bin/notify-send -t 5000 --urgency=low "Graphics Update" "Switched to $TYPE mirroring"
    STATE=5
    ;;
    5) 
    # laptop monitor is on, projectors are extending
    if [ "connected" = "$DP_1_STATUS" ]; then
        /usr/bin/xrandr --output eDP-1 --auto --output DP-1 --auto --above eDP-1
        TYPE="DP-1"
    elif [ "connected" = "$DP_2_STATUS" ]; then
        /usr/bin/xrandr --output DP-2 --auto --output DP-2 --auto --above eDP-1
        TYPE="DP-2"
    fi
    /usr/bin/notify-send -t 5000 --urgency=low "Graphics Update" "Switched to $TYPE extending"
    STATE=2
    ;;
    *)
    # Unknown state, assume we're in 1
    STATE=1 
esac    

echo $STATE > /tmp/monitor  
