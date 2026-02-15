#! /bin/env bash

# simple menu sys
echo "1. date"
echo "2. List"
echo "3. exit"

# -n 1: number of char
read -n 1 -p "Enter: " ch
echo

case $ch in
1) date
;;
2)ls
;;
3)exit
;;
*) echo "Wring choice!"
;;
esac
