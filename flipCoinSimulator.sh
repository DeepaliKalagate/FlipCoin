#!/bin/bash -x

-echo "welcome"
read -p "How many times do you want to flip the coin : " number
read -p "How many coins : " coin
declare -A result

headCount=0
tailCount=0
tailTail=0
headHead=0
tailHead=0
HeadTail=0

function coin() 
{
	for (( i=1; i<=$number; i++ ))
	do
		s=""
 	for(( j=0; j<$coin; j++ ))
 	do
    		resultk=$(( RANDOM % 2 ))

      	if [ $resultk == 1 ]
	then
   		s=$s"H"
           	headCount=$(( $headCount + 1 ))
	else
        	s=$s"T"
           	tailCount=$(( $tailCount + 1))
	fi
done
echo final key : $s
result["$s"]=$(( ${result["$s"]} + 1 ))  

done 
}
coin
echo ${!result[@]}
echo ${result[@]} 
itr=0
declare -A percentage
for i in "${!result[@]}"
do
	percentage[$i]=$(( (100*${result[$i]})/$number ))
done
sorting=$(printf "%s %s" ${percentage[@]} ${!percentage[@]} | sort -nr )
