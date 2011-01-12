#!/bin/sh
if [[ $# == "0" ]]; then
    echo "Show a QuickLook preview from the commandline."
    echo
    echo "Usage: "
    echo
    echo "`basename $0` [-t] filename"
    echo
    echo "  -t shows the filetype and QuickLook generator that will be used to generate the preview."
    exit 1
fi

if [[ $1 == "-t" ]]; then
    qlmanage -d 1 -o /dev/null -p "$2" 2>&1 | grep "Generator used" | awk -F'type ' '{print $2}' | uniq
    exit 0
fi

qlmanage -p "$@" >& /dev/null
