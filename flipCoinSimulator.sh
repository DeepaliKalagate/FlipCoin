#!/bin/bash -x
echo -e "Enter the no of time you want to flip coin : "
read numberOfTimes
coins=2
declare -A flipCoinDictionary


function coin() 
{
	for (( i=1; i<=$numberOfTimes; i++ ))
	do
		string=""
 		for(( j=0; j<$coins; j++ ))
 		do
   		flipCoin=$(( RANDOM % 2 ))
		if [ $flipCoin -eq 1 ]
		then
	   		string=$string"H"
		else
            		string=$string"T"
		fi
  		done
		echo coins : $string
		flipCoinDictionary["$string"]=$(( ${flipCoinDictionary["$string"]} + 1 ))
	done
}

coin
echo  $(printf "%s\n" ${!flipCoinDictionary[@]} | grep HH | wc  )
