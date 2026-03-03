#! /bin/env bash

# user management automation

set +x

# if [[ "$EUID" -ne 0 ]];then
#     echo "Run as a root!" >&2
#     exit 1
# fi


# is_strong_passwd(){
#     if [[ ! "$1" =~  [0-9]+.*[a-z]+.*[A-Z]+.* ]];then
#         echo "Passwd is weak!" >&2
#         return 1
#     else
#         return 0
#     fi
# }

create_user(){
    # take: user name
    # take: user passwd
    # show success
    user_name=""
    passwd=""
    read -r -p "Enter your uname: " user_name
    read -r -p -s "Enter your passwd: " passwd
    
    
}

is_strong_passwd "$1"

set +x
