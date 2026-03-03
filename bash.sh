#! /bin/env bash

set +x

: "${1:?"add your input file!"}"

while read line;do
    echo "$line"
done < "$1"

set +x