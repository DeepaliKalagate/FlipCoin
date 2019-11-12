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
HHHCount=0;
TTTCount=0;
HHTCount=0;
HTHCount=0;
THHCount=0;
TTHCount=0;
THTCount=0;
HTTCount=0;
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


function DoubletFlip()
{
		flipFirst="$(Flip)" 
		flipSecond="$(Flip)"

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


function TripletFlip()
{
	
		flipFirst="$(Flip)" 
		flipSecond="$(Flip)"
		flipThird="$(Flip)"

		if [[ $flipFirst -eq $isHead ]] && [[ $flipSecond -eq $isHead ]] && [[ $flipThird -eq $isHead ]]
		then
			HHHCount=$((HHHCount+1))
			resultDictionary[HHH]=$HHHCount

		elif [[ $flipFirst -eq $isTail ]] && [[ $flipSecond -eq $isTail ]] && [[ $flipThird -eq $isTail ]]
		then
			TTTCount=$((TTTCount+1))
			resultDictionary[TTT]=$TTTCount

		elif [[ $flipFirst -eq $isHead ]] && [[ $flipSecond -eq $isHead ]] && [[ $flipThird -eq $isTail ]]
		then
			HHTCount=$((HHTCount+1))
			resultDictionary[HHT]=$HHTCount

		elif [[ $flipFirst -eq $isHead ]] && [[ $flipSecond -eq $isTail ]] && [[ $flipThird -eq $isHead ]]
		then
			HTHCount=$((HTHCount+1))
			resultDictionary[HTH]=$TTTCount

		elif [[ $flipFirst -eq $isTail ]] && [[ $flipSecond -eq $isHead ]] && [[ $flipThird -eq $isHead ]]
		then
			THHCount=$((THHCount+1))
			resultDictionary[THH]=$THHCount

		elif [[ $flipFirst -eq $isTail ]] && [[ $flipSecond -eq $isTail ]] && [[ $flipThird -eq $isHead ]]
		then
			TTHCount=$((TTHCount+1))
			resultDictionary[TTH]=$TTHCount

		elif [[ $flipFirst -eq $isTail ]] && [[ $flipSecond -eq $isHead ]] && [[ $flipThird -eq $isTail ]]
		then
			THTCount=$((THTCount+1))
			resultDictionary[THT]=$THTCount

		elif [[ $flipFirst -eq $isHead ]] && [[ $flipSecond -eq $isTail ]] && [[ $flipThird -eq $isTail ]]
		then
			HTTCount=$((HTTCount+1))
			resultDictionary[HTT]=$HTTCount
		fi
}



function TripletPercentage()
{
	HHH=$(( $HHHCount*100 ))
	HHHPercentage=$(( $HHH/$1 ))

	TTT=$(( $TTTCount*100 ))
	TTTPercentage=$(( $TTT/$1 ))

	HHT=$(( $HHTCount*100 ))
	HHTPercentage=$(( $HHT/$1 ))

	HTH=$(( $HTHCount*100 ))
	HTHPercentage=$(( $HTH/$1 ))

	THH=$(( $THHCount*100 ))
	THHPercentage=$(( $THH/$1 ))


	TTH=$(( $TTHCount*100 ))
	TTHPercentage=$(( $TTH/$1 ))


	THT=$(( $THTCount*100 ))
	THTPercentage=$(( $THT/$1 ))


	HTT=$(( $HTTCount*100 ))
	HTTPercentage=$(( $HTT/$1 ))
}


for(( i=1; i<=$number; i++ ))
do
	#flip
	#DoubletFlip
	TripletFlip
done

#SingletPercentage $number
#DoubletPercentage $number
TripletPercentage $number


