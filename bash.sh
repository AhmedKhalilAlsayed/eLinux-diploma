#! /bin/env bash

for f in *.txt; do
    
    [[ -f "$f" ]] || continue
    
    mv "$f" "${f%.txt}"
    # echo "${f%.txt}"
done