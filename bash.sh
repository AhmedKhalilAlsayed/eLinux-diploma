#! /bin/env bash

# password checker

passwd=""

read -p "Enter password: " passwd
# echo

if [[ -z passwd ]]; then
echo "fail!"
exit 1
fi

# Checks:
checks=0
# - Length >= 8 characters
[[ passwd =~ .{8,} ]] && ((checks++))

# - Contains at least one uppercase letter
# - Contains at least one lowercase letter
# - Contains at least one number
# - Contains at least one special character (@, #, $, %, etc.)

echo "$checks"