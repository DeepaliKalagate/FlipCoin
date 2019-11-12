#!/bin/bash -x

read -p "Enter number of times to flip the coin" number

isHead=0
isTail=1
headsCount=0
tailsCount=0
declare -A resultDictionary

function calculation()
{
	for (( i=1; i<=$1; i++ ))
	do
		check=$(( RANDOM%2 ))

		if [ $check -eq $isHead ]
		then
			headsCount=$((headsCount+1))
			resultDictionary[Heads]=$headsCount
		else
			tailsCount=$((tailsCount+1))
			resultDictionary[Tails]=$tailsCount
		fi
	done
}

function calculatePercentage()
{
	head=$(( $headsCount*100 ))
	headPercentage=$(( $head/$1 ))
	tail=$(( $tailsCount*100 ))
	tailsPercentage=$(( $tail/$1 ))
}

calculation $number
calculatePercentage $number
