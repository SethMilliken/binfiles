#!/bin/bash
GROWLAPP=/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app
GROWLMENU=/Library/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlMenu.app
NOTIFICATION_SCRIPT=/usr/local/bin/growlnotify

function running {
	TARGET=$1
	MATCH=$2
	RESULT=`ps x | grep Growl | grep -v grep`
	if [[ $RESULT != "" ]]
	then
		killall -m -HUP Growl
	else
		open ${GROWLAPP}
		sleep 1
		${NOTIFICATION_SCRIPT} 'Growl' -a'GrowlHelperApp' -m'Restarted'
		open ${GROWLMENU}
	fi
}

running
