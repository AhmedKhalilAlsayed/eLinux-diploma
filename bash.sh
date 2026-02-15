#! /bin/env bash

# check arguments

if [[ -z "$1" ]]; then 
echo "Usage: $0 <filename>";
exit 1;
fi

# check file type
file="$1"

if [[ ! -e "$file" ]]; then
echo "file $file: does not exists!"
exit 1
fi 

if [[ -f "$file" ]]; then

echo "Is a file"

elif [[ -d "$file" ]]; then

echo "Is a dir"

elif [[ -L "$file" ]]; then

echo "Is a Link"

else
echo "Unknown!"
fi

# check extension

if [[ "$file" =~ \.(txt|bash|sh)$ ]];then
echo "text file"
fi

if [[ "$file" =~ \.elf$ ]];then
echo "bash file"
fi