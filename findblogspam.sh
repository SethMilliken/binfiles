#!/bin/bash
#grep -R href * | grep comments | grep -v araxia | grep -v tadhg | grep -v .svn
#echo '-----'
grep -R href * | grep comments | grep -v araxia | grep -v tadhg | grep -v .svn | awk -F':' '{print "sudo mv " $1 " /tmp/blogspam"}'
