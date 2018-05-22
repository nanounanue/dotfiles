#!/bin/bash
#Set variables KBLAYOUT_PATH, KEYBOARD_LAYOUTS and uncomment KEYBOARD_INITFLAG from here (line 2) to line 17.

#Path to a Keyboard Layout flag file (it will store your currently used layout)
KBLAYOUT_PATH=~/.KBLAYOUT
#Recommended 'KBLAYOUT_PATH=~/.KBLAYOUT', it's set to be stored as a hidden file in your home folder
# WARNING, if mistakenly you use an already existing file path and you won't be able to restore it!

#Keyboard Layouts list
KEYBOARD_LAYOUTS=( "us" "es" )
# get current layout with 'setxkbmap -query | grep layout'
# you can add/remove layouts from this example list
#KEYBOARD_LAYOUTS=( "us" "fr" "de" "latam" "us_intl" )

#Initilization
KEYBOARD_INITFLAG=true
# Finally, set line 17 to 'KEYBOARD_INITFLAG=true' and your're ready!

#script start
[[ -d $KBLAYOUT_PATH ]] &&  KEYBOARD_INITFLAG=false
if $KEYBOARD_INITFLAG
then
  [[ ! -f $KBLAYOUT_PATH ]] && touch $KBLAYOUT_PATH && echo "$KEYBOARD_LAYOUTS" > $KBLAYOUT_PATH
  KBLAYOUT=$(cat $KBLAYOUT_PATH)
  kbisnext=false
  #echo "KEYBOARD_LAYOUTS ${KEYBOARD_LAYOUTS[@]}"
  for layout in "${KEYBOARD_LAYOUTS[@]}"
  do
    #echo "Layout : $layout :"
    if $kbisnext
    then
      #echo "setting : $layout : as current layout"
      setxkbmap -layout $layout && KBLAYOUT=$layout
      kbisnext=false
      break
    fi
    if [ "$layout" = "$KBLAYOUT" ]
    then
      #echo "disabling current layout : $layout :"
      kbisnext=true
    fi
  done
  if $kbisnext || [ $KEYBOARD_LAYOUTS = "" ]
  then
    layout="$KEYBOARD_LAYOUTS"
    #echo "setting first : $layout : as current layout"
    setxkbmap -layout $layout && KBLAYOUT=$layout
  fi
  #echo "saving current layout : $KBLAYOUT :"
  echo "$KBLAYOUT" > $KBLAYOUT_PATH
  #notify-send Keyboard\ Layout $KBLAYOUT # << (recommended) uncomment if you have a notification daemon installed
  echo "Keyboard Layout : $layout"
else
  echo "Script not initialized. Please open with a text editor and set valid variables."
fi
