#!/bin/bash
GROWLHOME="/Library/PreferencePanes/Growl.prefPane/Contents/Resources/"
GROWLAPP=GrowlHelperApp.app
GROWLMENU=GrowlMenu.app
NOTIFICATION_SCRIPT="${HOME}/bin/notify"

function running {
    RESULT=`ps x | grep GrowlHelper | grep -v grep`
    if [[ $RESULT != "" ]]
    then
        killall -m -HUP GrowlHelperApp
        killall -m -HUP GrowlMenu
    else
        open_growl ${GROWLAPP}
        sleep 1
        ${NOTIFICATION_SCRIPT} 'Growl' "false" "Restarted" "Growl" "" "GrowlHelperApp"
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
