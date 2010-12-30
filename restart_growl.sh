#!/bin/bash
GROWLHOME="/Library/PreferencePanes/Growl.prefPane/Contents/Resources/"
GROWLAPP=GrowlHelperApp.app
GROWLMENU=GrowlMenu.app
NOTIFICATION_SCRIPT=/usr/local/bin/growlnotify

function running {
    RESULT=`ps x | grep Growl | grep -v grep`
    if [[ $RESULT != "" ]]
    then
        killall -m -HUP Growl
    else
        open_growl ${GROWLAPP}
        sleep 1
        ${NOTIFICATION_SCRIPT} 'Growl' -a'GrowlHelperApp' -m'Restarted'
        open_growl ${GROWLMENU}
    fi
}

function open_growl {
    APP=$1
    if [ -d ${GROWLHOME} ]; then
        open "${GROWLHOME}/${APP}"
    else
        open "${HOME}/${GROWLHOME}/${APP}"
    fi
}

running
