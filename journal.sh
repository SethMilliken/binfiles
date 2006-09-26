#!/bin/sh
DATE=`date '+%A, %B %d, %Y, %T %Z'`
TIME=`date '+%T %Z'`
LOCATION=${HOME}/sandbox/personal/zlog
FILENAME=`date +%Y-%m-%d`.txt 
FILE=${LOCATION}/${FILENAME}
# handle check-in option
if [ $1 ] && [ $1 = "ci" ]
then
	echo "Checking in outstanding journal entries..."
	svn ci ${LOCATION} -m"latest journal entries"
	exit 0
fi
# edit current journal
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
# go to end of file automatically
vi -c $ ${FILE}
