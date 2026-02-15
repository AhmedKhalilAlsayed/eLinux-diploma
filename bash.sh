#! /bin/env bash

# guess the number

secret=$((RANDOM %20 + 1))
count=1

echo "I'm thinking of a nubmer between 1 and 20"
echo "Can you guess it?"

while true; do

read -p "Your guess: " val

if [[ ! "$val" =~ ^[0-9]+$ ]];then
	echo "Usage: enter a number between 1 and 20"
	continue ###########
fi

if [[ $secret -eq val ]];then
	echo "Correct! You got it in ${count} attempts"
	break #############
	elif [[ val -lt $secret ]];then
	echo "Too low"
	((count++))
	elif [[ val -gt $secret ]];then
	echo "Too High"
	((count++))
fi

done