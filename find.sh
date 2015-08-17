#!/bin/sh
if [ $# -lt 1 ]; then
    echo "find in file:  $name"
    exit 1
fi
string=$1

grep -rn --color "$string" ./ --exclude-dir='.git' --exclude-dir='.svn' --exclude-dir='logs' --exclude='.gitconfig' --exclude='.bash_history' --exclude='templates_c'
