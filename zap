#!/bin/bash
APPNAME="${1}"
APP="${APPNAME}.app"
APPHOME="/Applications/"
APPPATH="${APPHOME}/${APP}"
NOTIFICATION_SCRIPT="${HOME}/bin/notify"

function ensure_running {
    RESULT=`ps x | grep "${APP}" | grep -v grep`
    if [[ $RESULT == "" ]]
    then
        open_app
        sleep 1
        ${NOTIFICATION_SCRIPT} "${APPNAME}" "false" "Restarted" "${APPNAME}" "" "${APPNAME}"
    fi
}

function open_app {
    if [ -d "${APPPATH}" ]; then
        open -g "${APPPATH}"
    fi
}

function clear_notifications {
# Need to quit because `close all notifications` doesn't reset notification
# positions.
osascript <<END_SCRIPT
tell application "Growl"
    quit
end tell
END_SCRIPT
sleep 1
osascript <<END_SCRIPT
tell application "Growl"
    close all notifications
end tell
END_SCRIPT
}

function bounce_app {
    killall "${APPNAME}" 2>/dev/null
    sleep 1
    ensure_running
}

bounce_app
