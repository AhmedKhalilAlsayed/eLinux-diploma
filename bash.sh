#! /bin/env bash

a=0
b=1
sum=0
n=5

for((i=0;i<n;i++)); do

echo ${a}

((sum=a+b))
((a=b)) # a=$b
((b=sum)) # b=sum XXXXXXXX wrong!

done