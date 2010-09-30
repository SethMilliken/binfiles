#!/bin/sh
for file in `ls -1`; do echo "Renaming: " $file; mv $file `echo $file | awk -F'?' '{print $1}'`; done
