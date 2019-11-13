#!/bin/bash
headcount=0
tailcount=0
declare -A flipCoinDictionary
function flipCoinCalculator
{
	echo $1
}
read -p "How many number of times you want to flip coin" numberOfFlips
read -p "Enter how many number of coins you want to flip" numberOfCoins
for(( j=1; j<=$numberOfFlips; j++ ))
do
	key=""
	for(( i=1; i<=$numberOfCoins; i++ ))
	do
		result="$( flipCoinCalculator $((RANDOM%2)) )"
		if [ $result -eq 1 ]
		then
			key=$key"H"
			headcount=$(( $headcount + 1 ))
		else
			key=$key"T"
			tailcount=$(( $tailcount + 1))	
		fi
done
flipCoinDictionary["$key"]=$(( ${flipCoinDictionary["$key"]} + 1 ))
echo "final key" $key
echo "Dictionary" ${flipCoinDictionary[@]}
done
echo $( printf "%s\n" ${!flipCoinDictionary[@]} ${flipCoinDictionary[@]} | sort -nr )
maxvalue=$( printf "%s\n" ${!flipCoinDictionary[@]} ${flipCoinDictionary[@]} | sort -nr | head -1 )
percentageOfMaxValue=$(( $maxvalue * 100 / $numberOfFlips ))
echo $percentageOfMaxValue
