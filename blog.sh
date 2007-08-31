#!/bin/sh
EDITOR=gvim
DATE=`date '+%A, %B %d, %Y, %T %Z'`
TIME=`date '+%T %Z'`
LOCATION=${HOME}/sandbox/personal/blog/seth/general
FILENAME=`date +%Y-%m-%d.%k-%M`.html
FILE=${LOCATION}/${FILENAME}
# edit current journal
if [ ! -f ${FILE} ] 
then
	touch ${FILE}
	echo ${DATE} >> ${FILE}
	echo '<p>' >> ${FILE}
	svn add ${FILE}
else
	echo '' >> ${FILE}
	echo '<p>' >> ${FILE}
	echo '' >> ${FILE}
fi
# go to end of file automatically
${EDITOR} -c $ ${FILE}
