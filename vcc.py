#!/usr/bin/python2.5
import os

dispatcher = {
		'svn info' : '~',
		'hg incoming' : '/Users/seth/sandbox/code/work/sb'
		}
for command, path in dispatcher:
	os.execvp(command, path)     
