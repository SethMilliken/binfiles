#!/bin/bash
GROWLAPP=/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app
NOTIFICATION_SCRIPT=/usr/local/bin/growlnotify
killall -HUP GrowlHelperApp
open ${GROWLAPP}
sleep 3
${NOTIFICATION_SCRIPT} 'Growl' -a'GrowlHelperApp' -m'Restarted'
