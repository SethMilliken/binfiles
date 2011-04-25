#!/bin/bash
APPNAME="Logic Node"

ORIGINAL_IFS=$IFS
CUSTOM_IFS=$'\n'$'\t'

function toggle_app {
    RESULT=`ps x | grep "${APPNAME}" | grep -v grep`
    if [[ $RESULT != "" ]]
    then
        kill_app
    else
        open_app
    fi
}

function bounce_app {
    kill_app
    sleep 1
    open_app
    echo ${APPNAME} restarted on ${HOSTNAME}.
}

function kill_app {
killall -m "${APPNAME}"
osascript <<END
    tell app "${APPNAME}" to quit
END
}

function open_app {
osascript <<END
    tell app "${APPNAME}" to launch
END
}

#toggle_app
bounce_app

IFS=$ORIGINAL_IFS
