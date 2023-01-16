#!/bin/bash
# Kasutajate loomise skript 
fail=$1
for kasutaja in $(cat $fail)
	do
		#echo $user
		source ./kasutaja.sh $kasutaja
	done

