#! /bin/env bash

# take 2 arg, $1 temp in C, $2 F/K

cToF(){
	 echo "scale=2; $1 * 9/5 + 32" | bc;
 }

cToK(){
	echo "scale=2; $1 + 273.15" | bc;
}

temp=$1
unit=$2

case $unit in 
F) echo "$(cToF $1)";;
K) echo "$(cToK $1)";;
*) echo "Fail!"; exit 1;;
esac