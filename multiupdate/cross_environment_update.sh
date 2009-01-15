#!/bin/bash
# Edits files named ${FILNAME} in directory tree under ${DIRECTORY} with file
# in the current directory.
DIRECTORY=${1} # Directory in which to start the search.
FILENAME=${2} # The name of the file to find.
CHANGELIST=${3} # The p4 change list in which to open the files for edit.
EX_SCRIPT=${4} # The ex script to apply to the files.
KEYWORD=${5} # Keyword indicating successful application of change.
### TODO: check here for correct number of arguments, show usage if incorrect.
find ${DIRECTORY} -name ${FILENAME} -exec echo {} \;
find ${DIRECTORY} -name ${FILENAME} -exec p4 edit -c ${CHANGELIST} {} \;
find ${DIRECTORY} -name ${FILENAME} -exec gvim -S ${EX_SCRIPT} {} \;
find ${DIRECTORY} -name ${FILENAME} -exec grep ${KEYWORD} {} \;

### Example ex script (add_availablePrintServers.ex):
#### /jobhandler.availableExecutionUnits/s/\(^.*$\)/\1\rjobhandler.availablePrintServers=2
#### :wq
### This will place the text following \r on a line immediately after the line containing everything between the first / and the /s.
