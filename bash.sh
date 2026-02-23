#! /bin/env bash

set +x


# validate args len

if [[ $# -lt 2 ]];then
    echo "Usage: ./script <src_files*> <des_dir>"
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


# add all args files srcs + des
for fd in "$@";do
    args+=("$fd")
done

des_dir="${args[$((arg_len-1))]}"

if [[ ! -d "$des_dir" ]];then
    echo "Should the last arg is a dir!"
    exit 1
fi

# here: validation is done
# should all files are exist
# should the last arg is the destenation dir

for (( i=0;i<"$arg_len"-1;i++ ));do
    
    src_file="${args[$i]}"
    
    if ! mv  "$src_file" "$des_dir"; then
        
        echo "${src_file}: faild!"
    else
        echo "${src_file}: done!"
    fi
done

set +x