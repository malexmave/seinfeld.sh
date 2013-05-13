#!/bin/bash
# Author: Max Maass
# 
# License:
# This code is licensed under the "Do whatever the hell you like with it"-License.
# I can not be held liable for any damages, including clawed out eyes due to the quality of the code.
# This Program was hacked together within 30 minutes or so, so do not expect fancy stuff.
# Have fun and be productive, and send pull requests at https://github.com/malexmave/seinfield.sh
if [ ! -f $SEINFILE ] ; then 
  echo ERROR: $SEINFILE does not exist!
  exit 1
fi
if [ "$1" = "do" ]
  then
    if `sed -n "/^#/!p" $SEINFILE | grep -q $2`
      then
        sed -i "/^$2/s/.$/#/" $SEINFILE
        sed -n "/^$2/p" $SEINFILE
    else
        echo $2 does not exist in $SEINFILE
        exit 1
    fi
elif [ "$1" = "undo" ]
  then
    if `sed -n "/^#/!p" $SEINFILE | grep -q $2`
      then
        sed -i "/^$2/s/.$/-/" $SEINFILE
        sed -n "/^$2/p" $SEINFILE
    else
        echo $2 does not exist in $SEINFILE
        exit 1
    fi
elif [ "$1" = "newday" ]
  then
    sed -i "/^#/!s/$/-/" $SEINFILE
elif [ "$1" = "ls" ]
  then
    sed -n "/^#/!p" $SEINFILE
fi
