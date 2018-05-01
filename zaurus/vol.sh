#!/bin/sh
# A script to select volume.

CMD="mixerctl outputs.headphones"
STAT="mixerctl -a"
VOL=$1

function run {
	preconditions
	set_volume $1
	exit 0
}

function set_volume {
	case $VOL in
		"help")	  echo "Ummmm...."
				  exit 0;
				  ;;
		"stat")	  ${STAT}
				  exit 0;
				  ;;
		*)		  ${CMD}=2${VOL}0,2${VOL}0
					echo 2${VOL}0
				  ;;
	esac
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
