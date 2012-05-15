#!/bin/bash
# Growl 3.0
GROWLHOME="/Applications/"
GROWLAPP="Growl.app"
NOTIFICATION_SCRIPT="${HOME}/bin/notify"

function ensure_running {
    RESULT=`ps x | grep Growl | grep -v grep`
    if [[ $RESULT == "" ]]
    then
        open_growl ${GROWLAPP}
        sleep 2
        ${NOTIFICATION_SCRIPT} 'Growl' "false" "Restarted" "Growl" "" "Growl"
    fi
}

function open_growl {
    APP=$1
    if [ -d ${GROWLHOME} ]; then
        open "${GROWLHOME}/${APP}"
    fi
}

function clear_notifications {
osascript <<END_SCRIPT
tell application "Growl"
    close all notifications
end tell
END_SCRIPT
}

ensure_running
clear_notifications
