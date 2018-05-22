#!/usr/bin/env bash

# https://www.reddit.com/r/unixporn/comments/3358vu/i3lock_unixpornworthy_lock_screen/
temp_file="/tmp/screen.png"
icon="$HOME/dotfiles/icons/rick_sanchez.png"
width=1920
height=1080
blur_factor=6
lock_blur_factor=0

# https://www.reddit.com/r/unixporn/comments/4yj29e/i3lock_simple_blur_script/
if [ "$1" == "screenshot" ]; then
  ffmpeg -f x11grab -video_size "${width}x${height}" -y -i $DISPLAY -i $icon -filter_complex "boxblur=$blur_factor:$blur_factor,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2,boxblur=$lock_blur_factor:$lock_blur_factor" -vframes 1 $temp_file
else
  ffmpeg -y -i "$(cat $HOME/dotfiles/wallpapers/nasa-71747-unsplash.jpg)" -i $icon -filter_complex "scale=$width:$height,boxblur=$blur_factor:$blur_factor,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2,boxblur=$lock_blur_factor:$lock_blur_factor" -vframes 1 $temp_file
fi

#--no-unlock-indicator
i3lock  --ignore-empty-password --image=$temp_file
rm $temp_file
