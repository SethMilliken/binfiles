#!/bin/sh
if [[ $# == "0" ]]; then
    echo "Show a QuickLook preview from the commandline."
    echo
    echo "Usage: "
    echo
    echo "`basename $0` [-t] filename"
    echo
    echo "  -t shows only the filetype and QuickLook generator that will be used to generate the preview."
    exit 1
fi

filename=$1
[[ $1 == "-t" ]] && filename=$2

qlmanage -d 1 -o /dev/null -p "$filename" 2>&1 | grep "Generator used" | awk -F'type ' '{print $2}' | uniq
[[ $1 == "-t" ]] && exit 0
qlmanage -p "$filename" >& /dev/null
