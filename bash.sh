#! /bin/env bash

# log file monitor

set +x

log_file="${1:?"Where the log file!"}"

keywords=("Error" "log" "debbug" "fix")

[[ ! -f "$log_file" ]] && echo "Wrong file!" && exit 1;

tail -Fn0 "$log_file" | while read -r line;do
    for kw in "${keywords[@]}";do
        if echo "$line" | grep -iw "$kw" &> /dev/null;then
            echo "$line"
        fi
        # can make a switch case
        # and make a special action like alarms, noti ...
        
    done
    
    
    
done


set +x
