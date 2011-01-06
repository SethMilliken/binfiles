#!/bin/bash
function timestamp {
    case $1 in
         1)
             FORMAT='%Y-%m-%d %H:%M:%S %Z'
             ;;
         *)
             FORMAT='%Y-%m-%d'
             ;;
    esac

    TIMESTAMP=$(date +"${FORMAT}")
    echo $TIMESTAMP | tee >(pbcopy)
    OLDIFS=$IFS
    IFS=    \

    $(which growlnotify) --identifier timestamp -a 'Terminal.app' -t copy -m "on clipboard: '"${TIMESTAMP}"'"
    IFS=$OLDIFS
}

function run {
    timestamp $1
    exit 0
}
run $@
