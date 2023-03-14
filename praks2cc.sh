#!/bin/bash
if [ $# -ne 1 ];
   then
    echo "Kasutusjuhend: $0 failinimi"
else
  failinimi-$1
 if [ -f $failinimi -a -r $failinimi ]; then
   echo "Fail on korras"
   for rida in $(cat $failinimi)
   do
     kasutajanimi-$(echo "$rida" | cut -fl -d:)
     sh lisa kasutaja Skasutajanimi
     echo "$rida" | chpasswd
    done
  else
echo "Probleem failiga $failinimi"
  fi
fi
