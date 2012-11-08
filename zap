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
        sleep 1
        ${NOTIFICATION_SCRIPT} 'Growl' "false" "Restarted" "Growl" "" "Growl"
    fi
}

function open_growl {
    APP=$1
    if [ -d ${APPHOME}/${APP} ]; then
        open -g "${APPHOME}/${APP}"
    fi
}

function clear_notifications {
osascript <<END_SCRIPT
tell application "Growl"
    close all notifications
end tell
END_SCRIPT
}

function bounce_growl {
    killall Growl 2>/dev/null
    sleep 1
    ensure_running
}

function bounce_divvy {
if [[ "$(basename $0)" == "zap-divvy" ]]; then
    killall Divvy 2>/dev/null
    open -g ${APPHOME}/${DIVVYAPP}
    ${NOTIFICATION_SCRIPT} 'Growl' "false" "Restarted" "Divvy" "" "Divvy"
fi
}

#clear_notifications
bounce_growl
#bounce_divvy
