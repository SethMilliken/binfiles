#!/bin/bash
# Usage example: metagen.sh blog-entry.html '2006-09-12 23:59:59'
if [ $# -lt 2 ]
then
		DATE=`date +'%Y-%m-%d %T'` 
fi
echo $@ ${DATE}
java -classpath "${HOME}/bin" BlojsomEntryMetadata "$@" "${DATE}"
