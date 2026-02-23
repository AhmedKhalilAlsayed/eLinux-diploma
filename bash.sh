#! /bin/env bash

set +x

# args take src files, and des to copy

# validate args

if [[ $# -lt 2 ]];then
    echo "Usage: ./script <src_files> <des_dir>"
    exit 1
fi

# validate are there src_files and des_d

are_found="TRUE"

for fd in "$@";do
    if [[ ! -e "$fd" ]];then
        echo "$fd: not found!"
        are_found="FALSE"
    fi
done

if [[ "$are_found" == "FALSE" ]];then
    exit 1
fi

# validate that the last arg (des) is a dir

args=()
arg_len=$#

for fd in "$@";do
    # add all args files srcs + des
    args+=("$fd")
done

if [[ ! -d "${args[$((arg_len-1))]}" ]];then
    echo "Should the last arg is a dir!"
    exit 1
fi

# here: validation is done
# should all files are exist
# should the last arg is the destenation dir

for (( i=0;i<"$arg_len"-1;i++ ));do
    
    # mv "${args[$i]}" "${args[$((arg_len-1))]}"
    
    if ! mv "${args[$i]}" "${args[$((arg_len-1))]}"; then
        # if [[ $? != 0 ]];then
        echo "${args[$i]}: faild!"
		else
		echo "${args[$i]}: done!"
    fi
done

set +x