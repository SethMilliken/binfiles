#!/bin/sh
ORIGINAL_IFS=$IFS
CUSTOM_IFS=$'\n'$'\t'

function run() {
	test_for_screen
	# function			spaces?	command		file
	#create_screen_window	'y'	"${HOME}/bin/mactail"	${HOME}/Documents/Eudora\ Folder/Eudora\ Log
	create_screen_window	'n'	'tail -F'	${HOME}/sandbox/backup/doing/doing.txt
	create_screen_window	'n'	'tail -F'	/var/log/system.log
	create_screen_window	'n'	'/usr/bin/syslog -w -C' '/usr/bin/syslog'
	create_screen_window	'n'	'tail -F'	/var/log/daemon
	exit 0
}

function create_screen_window() {
	IFS=$CUSTOM_IFS
	declare SPACE=$1
	declare COMMAND=$2
	declare FILE=$3
	declare ARGUMENTS=$4
	if [ -e "${FILE}" ]
	then
		echo $SPACE $COMMAND $FILE $ARGUMENTS
		do_command	${SPACE}	${COMMAND}	${FILE}	${ARGUMENTS}
	fi
}

function do_command() {
	declare SPACE=$1
	declare COMMAND=$2
	declare FILE=$3
	declare ARGUMENTS=$4
	case "$SPACE" in
		"y")	#echo "spaces in filenames"
				declare EXECUTE="screen	-t	${FILE}	${COMMAND}	${FILE}"
				;;
		"n")	#echo "no spaces in filenames"
				IFS=$ORIGINAL_IFS
				declare EXECUTE="screen -t ${FILE} ${COMMAND} ${FILE}"
				;;
	esac
	echo ${EXECUTE}
	${EXECUTE}
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
