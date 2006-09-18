#!/bin/sh
DATE=`date '+%A, %B %d, %Y, %T %Z'`
TIME=`date '+%T %Z'`
LOCATION=${HOME}/sandbox/personal/zlog
FILENAME=`date +%Y-%m-%d`.txt 
FILE=${LOCATION}/${FILENAME}
if [ ! -f ${FILE} ] 
then
	touch ${FILE}
	echo ${DATE}\\n >> ${FILE}
	svn add ${FILE}
else
	echo \\n${TIME}\\n >> ${FILE}
fi
# script to go to end of file automatically
${EDITOR} -c $ ${FILE}
#${edITOR} ${FILE} << EOF
