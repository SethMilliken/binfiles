#!/bin/bash
ORIGINAL_IFS=$IFS
IFS=$'\n'
file=/Users/milliken/bin/cleanup.files
CURRENT_PREV="Previous System 2"
PREV_SYSTEM_ROOT="/Previous Systems.localized/${CURRENT_PREV}"

function run {
	while read line
	do 
		handle_file "$line"
	done <"$file"
}

function handle_file {
	CURRENT_FILE="$PREV_SYSTEM_ROOT/$1"
	if [ -d "${CURRENT_FILE}" ]
	then
		echo sudo rm -rf \'"$CURRENT_FILE"\'
	fi

	if [ -f "${CURRENT_FILE}" ]
	then
		echo sudo rm -rf \'"$CURRENT_FILE"\'
	fi
}

run
IFS=$ORIGINAL_IFS
