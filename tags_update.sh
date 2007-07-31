#!/bin/sh
#TAG_ROOT=
find . -name '*.txt' -print0 | xargs -J % -0 -n1 echo | sed -e 's/\(\(.*\)\/\(.*\).txt\)/\3	\1	\/^/' | sort > tags
