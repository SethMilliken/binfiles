#!/bin/bash
# Select the editor to use based on availability.
MVIM=`which mvim`
GVIM=`which gvim`
VIM=`which vim`
VI=`which vi`

function run {
	for shell in ${MVIM} ${GVIM} ${VIM} ${VI}
	do
		shelltest ${shell}
	done
	exit 1
}

function shelltest() {
	CURRENTSHELL=$1
	if [ -f ${CURRENTSHELL} ]
	then
		echo ${CURRENTSHELL}
		exit 0
	fi	
}
run
