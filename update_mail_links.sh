#!/bin/bash
function previous_month {
	PREV_MONTHS="12 01 02 03 04 05 06 07 08 09 10 11"
	PREV_MONTH=`echo $PREV_MONTHS | awk '{print $'"${1}"'}'`
}
YEAR=`date +%Y`
MONTH=`date +%m`
DATE=${YEAR}-${MONTH}
previous_month `date +%m`
PREVIOUS_DATE=${YEAR}-${PREV_MONTH}

function update_path {
	CURRENT_LINK=$1
	MATCH_STRING=$2
	if [[ -L ${CURRENT_LINK} ]]
	then
		FULLPATH=`ls -l ${CURRENT_LINK} | awk '{print $11}'`
		DIRECTORY=`dirname ${FULLPATH}`
		NEW_TARGET=`ls ${DIRECTORY}/${MATCH_STRING}*`
		if [[ ${NEW_TARGET} != "" && -e ${NEW_TARGET} ]]
		then
			if [[ $NEW_TARGET == $FULLPATH ]]
			then
				# echo No new target for ${CURRENT_LINK} ": " $FULLPATH  
				continue
			else
				echo "New target for " ${CURRENT_LINK} ": " $NEW_TARGET
				ln -shf ${NEW_TARGET} ${CURRENT_LINK}
				continue
			fi
		else
			echo "Could not find target for" ${CURRENT_LINK} ": " $NEW_TARGET
			continue
		fi
	else
		echo "Not a symbolic link: " ${CURRENT_LINK}
		continue
	fi
}

for link in `ls -1`
do
	# A couple of exceptions
	if [[ $link == "previous" ]]
	then
		update_path $link ${PREVIOUS_DATE} 
		continue
	fi
	if [[ $link == "nf" ]]
	then
		continue
	fi
	# Everything else
	update_path $link ${DATE} 
done
