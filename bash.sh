#! /bin/env bash

read -p "Enter your age: " age

# check the age is a number!
# you can do it with regex
set -x
if [[ ! "$age" =~ ^[0-9]+$ ]]; then
echo "Is not a positve number"
exit 1
fi 

# check range 6 to 80

if [[ $age -lt 6 || $age -gt 80 ]];then
echo "Must be in range 6 to 80 years!"
exit 1
fi

# categorize
if [[ $age -lt 7 ]];then
echo "Child"
elif [[ $age -lt 15 ]];then
echo "Will be a man"
else
echo "مُكلف"
fi
set +x