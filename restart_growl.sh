#!/bin/bash
GROWLAPP=${HOME}/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app
NOTIFICATION_SCRIPT=/usr/local/bin/growlnotify
killall -HUP GrowlHelperApp
open ${GROWLAPP}
sleep 2
${NOTIFICATION_SCRIPT} 'Growl' -a'GrowlHelperApp' -m'Restarted'
