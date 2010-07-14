#!/bin/bash
NOTIFICATION_SCRIPT=/usr/local/bin/growlnotify
if ps ax | grep firefox-bin | awk '{print $3}' | grep T
then
	killall -CONT firefox-bin
	RESULT="Thawed"
else
	killall -STOP firefox-bin
	RESULT="Frozen"
fi
${NOTIFICATION_SCRIPT} 'Firefox' -a'Firefox' -m${RESULT}
