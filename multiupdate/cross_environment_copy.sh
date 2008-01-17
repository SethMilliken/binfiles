#!/bin/bash
# Replaces files named ${FILENAME} in directory tree under ${DIRECTORY} with file
# with the same name in the current directory.
# Also checks out files for edit in p4 changelist # ${CHANGELIST}.
DIRECTORY="${IV4_ROOT}/conf"
FILENAME=${1}
CHANGELIST="23644"
find ${DIRECTORY} -name ${FILENAME} -exec p4 edit -c ${CHANGELIST} {} \;
find ${DIRECTORY} -name ${FILENAME} -exec echo {} \;
find ${DIRECTORY} -name ${FILENAME} -exec cp ${FILENAME} {} \;
