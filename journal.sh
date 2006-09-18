#!/bin/sh
DATE=`date '+%A, %B %d, %Y, %T %Z'`
TIME=`date '+%T %Z'`
LOCATION=${HOME}/sandbox/personal/zlog
FILENAME=`date +%Y-%m-%d`.txt 
FILE=${LOCATION}/${FILENAME}
if [ ! -f ${FILE} ] 
then
	touch ${FILE}
	echo ${DATE} >> ${FILE}
	echo '' >> ${FILE}
	svn add ${FILE}
else
	echo '' >> ${FILE}
	echo ${TIME} >> ${FILE}
	echo '' >> ${FILE}
fi
# script to go to end of file automatically
${EDITOR} -c $ ${FILE}
#${EDITOR} ${FILE} << EOF
