#! /bin/env bash

set +x

str="Ahmed"

echo "${str:1}"
echo "${str: -2}" # space
echo "${str:2:6}"
echo "${str::7}"

set +x