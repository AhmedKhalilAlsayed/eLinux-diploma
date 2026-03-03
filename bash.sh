#! /bin/env bash

set +x

str="Hello Hello World!"

echo "0 ${str}"
echo "0 ${str^^}"
s="${str^^}"
echo "0 ${s,}"
echo "1 ${str//Hello/Hi}"
echo "2 ${str//Hel*o/Hi }"
echo "3 ${str/%World/Hi}"
echo "4 ${str/%World!/Hi}"
echo "5 ${str/#Hello/Hi}"

set +x