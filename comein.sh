#!/bin/sh
DATE=`date '+%A, %B %d, %Y, %T %Z'`
TIME=`date '+%T %Z'`
ORIGINAL_FILE=${HOME}/sandbox/personal/comein.txt
FILE=/tmp/`date +%Y-%m-%d`.txt 
if [ ! -f ${FILE} ] 
then
	touch ${FILE}
	cat ${ORIGINAL_FILE} >> ${FILE}
fi
open ${FILE}
