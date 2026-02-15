#! /bin/env bash

read -p "Enter file path: " file

if [[ -e "$file" ]]; then
echo "File exists"
else
echo "File not exists"
exit 1
fi

if [[ -f "$file" ]]; then
echo "Type: Regular file"
elif [[ -d "$file" ]];then
echo "Type: Dir"
elif [[ -L "$file" ]];then
echo "Type: Link"
else
echo "Type: Unknown"
fi

# my way - works
# msg="Permissions: "
# if [[ -r "$file" ]];then
# msg="${msg}readable, "
# fi
# if [[ -w "$file" ]];then
# msg="${msg}writable, "
# fi
# if [[ -x "$file" ]];then
# msg="${msg}exe"
# fi
# echo "$msg"

# جامدة الصراحة
perm=""
[[ -r "$file" ]] && perm+="readable, "
[[ -w "$file" ]] && perm+="writeable, "
[[ -x "$file" ]] && perm+="exe"

if [[ -n "$perm" ]];then
echo "Per: $perm"
else
echo "Per: Nothing!"
fi