#!/bin/bash
#
# Dependencies: imagemagick, i3lock
#
# A script that takes current screenshot and blurs it to be
# used with i3lock
#
# Copyright © 2016 Bharadwaj Machiraju <tunnelshade at gmail dot com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
}

trap revert HUP INT TERM
xset +dpms dpms 0 0 5
scrot -d 1 /tmp/locking_screen.png
convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
convert -composite /tmp/screen_blur.png ~/dotfiles/icons/its_locked_morty_no_bg.png -gravity South -geometry -20x1200 /tmp/screen.png
i3lock --ignore-empty-password --show-failed-attempts --image=/tmp/screen.png
revert


#scrot /tmp/screen_locked.png
#convert /tmp/screen_locked.png -blur 0x4 /tmp/screen_locked2.png
#i3lock -i /tmp/screen_locked2.png
