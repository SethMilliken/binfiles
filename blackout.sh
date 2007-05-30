#!/bin/sh
  
MAGIC_NUMBER=107374183
PMSET=/usr/bin/pmset
GREP=/usr/bin/grep
AWK=/usr/bin/awk
SLEEP=/bin/sleep
    
$PMSET force -a displaysleep $MAGIC_NUMBER
$SLEEP 1
$PMSET force -a displaysleep `$PMSET -g | $GREP displaysleep | $AWK '{print $2}'`
$SLEEP 1
