#!/bin/sh
# TODO: figure out what is wrong with 1 format
function timestamp {
	case $1 in
		 1)
		     FORMAT='+%Y-%m-%d\ %H:%M:%S\ %Z'
			 ;;
		 *)
		     FORMAT='+%Y-%m-%d'
			 ;;
	esac

	TIMESTAMP=`date ${FORMAT}`
	echo ${TIMESTAMP} | pbcopy
	growlnotify --identifier timestamp -a 'Terminal.app' -t copy -m "on clipboard: '"${TIMESTAMP}"'"
}

function run {	
	timestamp $1
	exit 0
}
run $@

