#!/bin/bash
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
    sed -n '/^#/!p' $SEINFILE | sed -e 's/#/\x1b[32m&\x1b[0m/g' -e 's/-/\x1b[33m&\x1b[0m/g'
fi
