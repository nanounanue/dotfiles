#!/usr/bin/env bash

# You may need to comment out the next line to disable access control.
xhost +SI:localuser:$USER

# Set themes, etc.
gnome-settings-daemon &

# Set fallback cursor.
xsetroot -cursor_name left_ptr

# Set keyboard repeat rate.
xset r rate 200 60

xrdb ~/.Xresources

# If Emacs is started in server mode, `emacsclient` is a convenient way to
# edit files in place (used by e.g. `git commit`).
export VISUAL=emacsclient
export EDITOR="$VISUAL"

# Finally launch emacs.
#exec dbus-launch --exit-with-session emacs


