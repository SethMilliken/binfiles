#!/bin/sh
# TODO: support --export
# TODO: support --norefresh
if [ -n "$2" ]; then
    RAW_TITLE="\"${2}\""
    TITLE=" --title $RAW_TITLE"
fi

COMMAND="grip $1 $TITLE 0.0.0.0:8888"
echo $COMMAND
echo $COMMAND | sh
