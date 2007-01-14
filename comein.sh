#!/bin/sh
DATE=`date '+%A, %B %d, %Y, %T %Z'`
TIME=`date '+%T %Z'`
ORIGINAL_FILE=${HOME}/sandbox/personal/todo/comein.txt
FILE=/tmp/`date +%Y-%m-%d`.txt 
if [ ! -f ${FILE} ] 
then
	touch ${FILE}
	cat ${ORIGINAL_FILE} >> ${FILE}
fi
open ${FILE}

osascript <<END_SCRIPT
tell application "TextEdit"
	-- zoomed in vertical monitor
	set bounds of window 1 to {-1200, -576, 0, 1024}
	tell text of document 1
		set the size to 32
	end tell
end tell
END_SCRIPT
