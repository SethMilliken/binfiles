#!/bin/sh
# A script to manage a LAN card connection.
# Allow args with spaces in names.
IFS=''
DEV_NAME=ne0
TEST_PING_ADDRESS=araxia.net
DEBUG_COMMAND=sudo
PRESET_NETWORK_NAMES="Available Presets:\
up, down"

function run {
	preconditions
	select_network ${NETWORK_NAME} 
	exit 0
}

function select_network {
	case $1 in
		"-ls")	  echo ${PRESET_NETWORK_NAMES}
				  exit 0;
				  ;;
		"down")	  ${DEBUG_COMMAND} ifconfig ${DEV_NAME} down
				  exit 0;
				  ;;
		"up")	  ${DEBUG_COMMAND} dhclient ${DEV_NAME}
				  # fall through 
				  ;;
		*)
				  ${DEBUG_COMMAND} ping -c 3 ${TEST_PING_ADDRESS}
				  ;;
	esac
	# check for existence of selected network
}

function preconditions {
	case "`uname`" in
		"Darwin")	echo "Entering debug mode..."
					DEBUG_COMMAND="echo"
					;;
		"OpenBSD")	;; 	
				*)			echo "This command only works in OpenBSD with a wi0 device."
			   		exit 1
					;;
	esac
	# test for network adaptor
	# just [ -f /dev/wi0 ] ?
}
run
