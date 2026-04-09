#! /bin/env bash

#!

set -e


#! private
#! public
#! main

name="Ahmed Khalil"

cat << EOF >> heredocfile.txt
hello I'm $name
And this is a heredoc style
EOF

set +e
