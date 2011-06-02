#!/bin/bash
#
# firefox_toggle
#
# Suspends and resumes all Firefox instances.
# Posts a growl notification to indicate status.
#

NOTIFICATION_SCRIPT=${HOME}/bin/notify
FIREFOX_NAME="FirefoxTenFour"
FIREFOX_PROCESS="firefox-bin"
if ps ax | grep ${FIREFOX_PROCESS} | awk '{print $3}' | grep T
then
	killall -CONT ${FIREFOX_PROCESS}
	RESULT="Thawed"
else
	killall -STOP ${FIREFOX_PROCESS}
	RESULT="Frozen"
fi
${NOTIFICATION_SCRIPT} $(basename $0) "false" "${RESULT}" "${FIREFOX_NAME}"
#${GROWLNOTIFY} --identifier $0 -t 'Firefox' -a "${FIREFOX_NAME}" -m ${RESULT}
