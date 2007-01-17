#!/bin/bash
function run() {
	test_for_screen
	create_screen_window /var/log/system.log
	create_screen_window ${HOME}/sandbox/backup/doing/doing.txt
	create_screen_window /Library/Logs/Console/$UID/console.log
	exit 0
}

function create_screen_window() {
	declare FILE=$1
	if [ -f ${FILE} ]
	then
			do_command "screen -t ${FILE} tail -F" ${FILE}
	fi
}

function do_command() {
	COMMAND=$1
	ARGUMENTS=$2
	${COMMAND} ${ARGUMENTS}
	sleep 1
}

function test_for_screen() {
	case "$TERM" in
			"screen")	;; 	
			*)			echo "screen not active."
				   		exit 1
						;;
	esac
}
run
