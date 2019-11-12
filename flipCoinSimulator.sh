#!/bin/bash -x

read -p "Enter number of times to flip 2 coins simultaneously" number

isHead=0
isTail=1
headsCount=0
tailsCount=0
HHCount=0;
TTCount=0;
HTCount=0;
THCount=0;
declare -A resultDictionary


function Flip()
{
		check=$(( RANDOM%2 ))

		if [ $check -eq $isHead ]
		then
			headsCount=$((headsCount+1))
			resultDictionary[Heads]=$headsCount
		else
			tailsCount=$((tailsCount+1))
			resultDictionary[Tails]=$tailsCount
		fi

		echo $check
}

function SingletPercentage()
{
	head=$(( $headsCount*100 ))
	headPercentage=$(( $head/$1 ))
	tail=$(( $tailsCount*100 ))
	tailsPercentage=$(( $tail/$1 ))
}


function DoubletPercentage()
{
	HH=$(( $HHCount*100 ))
	HHPercentage=$(( $HH/$1 ))


	TT=$(( $TTCount*100 ))
	TTPercentage=$(( $TT/$1 ))

	
	HT=$(( $HTCount*100 ))
	HTPercentage=$(( $HT/$1 ))

	
	TH=$(( $THCount*100 ))
	THPercentage=$(( $TH/$1 ))
}

function DoubletFlip()
{
		flipFirst="$(Flip)" 
		flipSecond="$(Flip)"
		echo $flipFirst
		echo $flipSecond
		if [[ $flipFirst -eq $isHead ]] && [[ $flipSecond -eq $isHead ]]
		then
			HHCount=$((HHCount+1))
			resultDictionary[HH]=$HHCount

		elif [[ $flipFirst -eq $isTail ]] && [[ $flipSecond -eq $isTail ]]
		then
			TTCount=$((TTCount+1))
			resultDictionary[TT]=$TTCount

		elif [[ $flipFirst -eq $isHead ]] && [[ $flipSecond -eq $isTail ]]
		then
			HTCount=$((HTCount+1))
			resultDictionary[HT]=$HTCount 

		elif [[$flipFirst -eq $isTail ]] && [[ $flipSecond -eq $isHead ]]
		then
			THCount=$((THCount++))
			resultDictionary[TH]=$THCount
		fi
}

#for(( i=1; i<=$number; i++ ))
#do
#	Flip
#done


for(( i=1; i<=$number; i++ ))
do
	DoubletFlip
done


DoubletPercentage $number



