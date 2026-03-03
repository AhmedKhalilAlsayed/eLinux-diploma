#! /bin/env bash

# parameter expansion for string manipulation

set +x

process_path(){
    local path=$1
    [[ -z "$path" ]] && exit 1
    
    local filename="${path##*/}" # longest prefix
    local dirname="${path%/*}" # shortest suffix
    local basename="${filename%%.*}" # longest suffix
    # local basename="${filename%.*}" # shortest suffix
    local exe="${filename#*.}" # shortest prefix
    
    echo "$path"
    echo "$dirname"
	echo "$filename"
    echo "$basename"
    echo "$exe"
}

process_path "$1"


set +x