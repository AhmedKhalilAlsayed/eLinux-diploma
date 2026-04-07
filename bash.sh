#! /bin/env bash

#! passwd generator

set -e


#! private
#! public
generate_passwd(){
    local len="${1:?"Enter the length!"}"
    
    # if [[ len -lt 8 ]];then
    #     echo "The len is less than 8!, please make it longer"
    #     echo
    # fi
    tr -dc "A-Za-z0-9!@#$%^&*()_" < /dev/random | head -c "$len"
    echo
}

#! main

PASS=$(generate_passwd "$1")
echo "Generated passwd: $PASS"

set +e
