#! /bin/env bash

# calc takes 3 args 5 + 3
# out 5 + 3 = 8

num1=$1
op=$2
num2=$3
result=0

case $op in
+) ((result = num1 + num2))
;;
-) ((result = num1 - num2))
;;
\*) ((result = num1 * num2))
;;
/) ((result = num1 / num2))
;;
*) echo "Fail!"; exit 1;
;;
esac

echo "${num1} ${op} ${num2} = ${result}"