#!/bin/bash
#
# firefox_toggle
#
# Suspends and resumes all Firefox instances.
# Posts a growl notification to indicate status.
#
GROWLNOTIFY=/usr/local/bin/growlnotify
FIREFOX_NAME="Firefox 3.6.app"
FIREFOX_PROCESS="firefox-bin"
if ps ax | grep ${FIREFOX_PROCESS} | awk '{print $3}' | grep T
then
	killall -CONT ${FIREFOX_PROCESS}
	RESULT="Thawed"
else
	killall -STOP ${FIREFOX_PROCESS}
	RESULT="Frozen"
fi
${GROWLNOTIFY} --identifier $0 -t 'Firefox' -a "${FIREFOX_NAME}" -m ${RESULT}
