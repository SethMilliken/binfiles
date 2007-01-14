#!/bin/bash
SVN=`which svn`
SVN_COMMAND="${SVN} -q status"

function svnstatus() {
if [ -e "${1}" ]
then
		echo "DOING \"${SVN_COMMAND} '${1}'\""	
		${SVN_COMMAND} "${1}"
		#svn -q status "${1}"
		echo ""
else
		echo "skipping \"${1}\""
fi
}

IFS=$'\n' # Trick to allow spaces in file paths; IFS = internal field separator
foo[1]="${HOME}/sandbox/personal"
foo[2]="${HOME}/sandbox/code"
foo[3]="${HOME}"
foo[4]="${HOME}/sandbox/backup/doing/"
foo[5]="${HOME}/Library/Application Support/Adium 2.0/Users/Default/Logs/"
foo[6]="${HOME}/bin"

INDEX=0
while [ ${INDEX} -lt ${#foo[@]} ]
do
		let "INDEX=${INDEX} + 1"
		svnstatus ${foo[${INDEX}]}
done

exit 0
