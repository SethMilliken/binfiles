#!/bin/bash
# Look at ${FILENAME} in directory tree under ${DIRECTORY} with file
# with the same name in the current directory.
DIRECTORY=${1}
FILENAME=${2}
find ${DIRECTORY} -name ${FILENAME} -exec echo {} \;
#find ${DIRECTORY} -name ${FILENAME} -exec cp ${FILENAME} {} \;
