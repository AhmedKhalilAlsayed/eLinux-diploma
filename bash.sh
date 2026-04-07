#! /bin/env bash

# user management automation

set -e

if [[ "$EUID" -ne 0 ]];then
    echo "Please, run as a root!" >&2
    exit 1
fi


# privates

is_strong_passwd(){
    passwd="$1"
    # Checks:
    chech_score=0
    # - Length >= 8 characters
    [[ "$passwd" =~ .{8,} ]] && ((chech_score++))
    
    # - Contains at least one uppercase letter
    [[ "$passwd" =~ [A-Z] ]] && ((chech_score++))
    
    # - Contains at least one lowercase letter
    [[ "$passwd" =~ [a-z] ]] && ((chech_score++))
    
    # - Contains at least one number
    [[ "$passwd" =~ [0-9] ]] && ((chech_score++))
    
    # - Contains at least one special character (@, #, $, %, etc.)
    [[ "$passwd" =~ [^0-9A-Za-z] ]] && ((chech_score++))
    
    
    if [[ "$chech_score" -gt 3 ]]; then
        return 0
    else
        echo "Weak pass!"
        return 1
    fi
}

# public

create_user(){
    
    # take the name and passwd
    # validate them
    
    local user_name=""
    local passwd=""
    while true;do
        
        read -r -p "Enter your name: " user_name
        read -r -p "Enter your passwd: " -s passwd
        echo
        echo "Checking..."
        sleep 1
        
        if is_strong_passwd "$passwd" && [[ ! -z "$user_name" ]];then
            echo "Good passwd and name with score $chech_score of 5"
            echo
            
            break
        else
            echo "Sorry, do it again (check the passwd/user_name)"
            echo
            
        fi
    done
    
    
    # start create a new user
    if useradd -m "$user_name" -p "$passwd";then
        echo "User $user_name has been created successfully."
    else
        echo "Failed to create user $user_name." >&2
    fi
    
    echo
    
}

delete_user(){
    local user_name=""
    
    read -r -p "Enter your name: " user_name
    
    if userdel -r "$user_name";then
        echo "User $user_name has been deleted successfully."
    else
        echo "Failed to delete user $user_name." >&2
    fi
    echo
    
}

# main

choice=""

# Menu options
echo "Choose an action:"
echo "1. Create a new user"
echo "2. Delete a user"

read -r -n 1 -p "Enter your choice: " choice
echo
echo

case "$choice" in
    1)
        create_user
    ;;
    2)
        delete_user
    ;;
    *)
        echo "Wrong choice!"
        echo
        exit
esac

set +e
