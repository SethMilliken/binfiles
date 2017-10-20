#!/bin/sh
[ $# -ge 1 -a -f "$1" ] && cat "$1" | jq || input="-" cat $input | sh | jq
