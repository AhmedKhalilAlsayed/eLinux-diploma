#! /bin/env bash

# password checker

passwd=""

read -p "Enter password: " passwd

if [[ -z passwd ]]; then
echo "fail!"
exit 1
fi

# Checks:
checks=0
# - Length >= 8 characters
[[ "$passwd" =~ .{8,} ]] && ((checks++))

# - Contains at least one uppercase letter
[[ "$passwd" =~ [A-Z] ]] && ((checks++))

# - Contains at least one lowercase letter
[[ "$passwd" =~ [a-z] ]] && ((checks++))

# - Contains at least one number
[[ "$passwd" =~ [0-9] ]] && ((checks++))

# - Contains at least one special character (@, #, $, %, etc.)
[[ "$passwd" =~ [\!\@\#\$\%\^\&\*\(\)\_\+] ]] && ((checks++))


if [[ checks -eq 5 ]]; then
echo "Strong pass"
elif [[ checks -ge 3 ]]; then
echo "Medium pass"
else
echo "Weak pass!!!!!"
fi