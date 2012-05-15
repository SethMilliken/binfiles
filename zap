#!/bin/bash
# Growl 3.0
APPHOME="/Applications/"
GROWLAPP="Growl.app"
DIVVYAPP="Divvy.app"
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
    if [ -d ${APPHOME} ]; then
        open "${APPHOME}/${APP}"
    fi
}

function clear_notifications {
osascript <<END_SCRIPT
tell application "Growl"
    close all notifications
end tell
END_SCRIPT
}


function bounce_divvy {
    killall Divvy 2>/dev/null
    open ${APPHOME}/${DIVVYAPP}
    ${NOTIFICATION_SCRIPT} 'Growl' "false" "Restarted" "Divvy" "" "Divvy"
}

ensure_running
clear_notifications
bounce_divvy
