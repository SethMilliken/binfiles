#!/bin/bash
function run() {
	test_for_screen
	do_command 'screen tail -F' "/var/log/system.log"
	do_command 'screen tail -F' "/Library/Logs/Console/${UID}/console.log"
	do_command 'screen tail -F' "${HOME}/sandbox/backup/doing/doing.txt"
	exit 0
}

function do_command() {
	COMMAND=$1
	FILE=$2
	if [ -e "${FILE}" ]
	then
			echo "${COMMAND}" "${FILE}"
	fi
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
