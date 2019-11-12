#!/bin/bash

isHead=0
isTail=1

check=$(( RANDOM%2 ))

if [ $check -eq $isHead ]
then
	echo "heads"
else
	echo "tails"
fi

