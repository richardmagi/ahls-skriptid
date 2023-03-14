#!/bin/bash
echo "Sisetage kaust, mida soovite varundada. (Sisetage täielik tee)"
read kaust
echo "Sisetage siht, kuhu salvestada. (Sisetage täielik tee)"
read siht

if [[ ! -z "$kaust" ]]; then
  kuupaev=`date +%d.%m.%Y`
  tar -c -f $filename.$kuupaev.tar $filename/
  gzip $filename.$kuupaev.tar
  mv $filename.$kuupaev.tar.gz $siht
else
  echo "Sisestage korrektne kausta tee jutumärkides"

fi
