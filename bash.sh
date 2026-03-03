#! /bin/env bash

# log file monitor

set +x

log_file="${1:?"Where the log file!"}"
keywords="Error"

[[ ! -f "$log_file" ]] && echo "Wrong file!" && exit 1;

tail -Fn0 "$log_file" | while read -r line;do
    if echo "$line" | grep -i "$keywords" &> /dev/null;then
        echo "$line"
    fi
    
done


set +x
