#!/bin/bash
if [ $# -ne 1 ];
 then
   echo "Alustage programm kasutajafailiga"
else
   fail=$1
  if [ -f $fail -a -r $fail ];
    then
     echo "Fail on korras"
     for nimi in $(cat $fail)
     do
      sh praks2a.sh $nimi
    done
 else
   echo "Probleem kasutajafailiga $fail"
  fi
fi
