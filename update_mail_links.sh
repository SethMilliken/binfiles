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
MAILDIR=${HOME}/Maildir

#DEBUG="echo "
DEBUG=""

function update_path {
    CURRENT_LINK=$1
    MATCH_STRING=$2
    if [ -L ${CURRENT_LINK} ]
    then
        echo "Looking for match to $MATCH_STRING for link $CURRENT_LINK"
        FULLPATH=`ls -l ${CURRENT_LINK} | awk '{print $11}'`
        #echo "Full path: $FULLPATH"
        CANDIDATE=`echo $FULLPATH | sed -e "s/\(.*\.\)\(archive\.\)*\([0-9]*-[0-9]*\)\(.*\)/\1${MATCH_STRING}\4/"`
        #echo "Candidate: $CANDIDATE"
        #echo "New target: $NEW_TARGET"
        NEW_TARGET=`ls -d ${CANDIDATE}`
        if [[ ${NEW_TARGET} != "" && -e ${NEW_TARGET} ]]
        then
            if [[ $NEW_TARGET == $FULLPATH ]]
            then
                # echo No new target for ${CURRENT_LINK} ": " $FULLPATH
                : no-op
            else
                echo "New target for " ${CURRENT_LINK} ": " $NEW_TARGET
                ${DEBUG} rm ${CURRENT_LINK}
                ${DEBUG} ln -sf ${NEW_TARGET} ${CURRENT_LINK}
                : no-op
            fi
        else
            echo "Could not find target for" ${CURRENT_LINK} ": " $NEW_TARGET
        fi
    else
        # echo "Not a symbolic link: " ${CURRENT_LINK}
        : no-op
    fi
}

function contains {
    TARGET=$1
    MATCH=$2
    RESULT=`echo $TARGET | sed -e "/$MATCH/g"`
    if [[ $RESULT != "" ]]
    then
        return 0
    else
        return 1
    fi
}

cd "${MAILDIR}"
for link in `ls -1d .*`
do
    # A couple of exceptions
    if [[ $link == "." ]]
    then
        continue
    fi
    if [[ $link == ".." ]]
    then
        continue
    fi
    if [[ $link == ".current.in" ]]
    then
        continue
    fi
    if [[ $link == ".current.impersonal" ]]
    then
        continue
    fi
    if [[ $link == ".current.receipts" ]]
    then
        continue
    fi
    contains $link "prev"
    VALUE=$?
    if [[ $VALUE -eq 1 ]]
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

# vim:et:ts=4 sw=4
