#! /bin/env bash

#!

set -e


#! private
#! public
help(){
cat << EOF
Usage:
	-v, --version
	-n, --name <Enter your name>
EOF
}

#! main

if ! options=$(getopt -o vn: --long version,name: -n "$0" -- "$@");then
    echo
    help
    exit
fi

# to be safe with spaces
eval set -- "$options"

while true;do
    case "$1" in
        -v|--version)
            echo "v 0"
            shift
        ;;
        -n|--name)
            echo "Welcome $2"
            shift 2
        ;;
        --)
            shift
            break
        ;;
        *)
            echo "No option!"
            break
        ;;
    esac
done

set +e
