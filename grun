#!/usr/bin/python
# 
# grun
#
# Run a commandline that posts a growl notification when it completes.
# Each command gets its own individual sticky notification that is updated on completion.
#
# TODO: support && compound commands, e.g. grun.py (echo "Initial output." && sleep 5 && echo "Final output.")
# TODO: parameterize growlnotify location
# TODO: Testing
from sys import argv
import os, subprocess, string

original_command = " ".join(argv[1:])

def postnotification(identifier, title, message):
    os.system("growlnotify --identifier " + str(identifier) + " --sticky -a 'Terminal.app' -t '" + title + "' -m \"" + message + "\"")

#os.system("echo Executing with Growl completion notification: " + original_command)
p = subprocess.Popen(argv[1:])
postnotification(p.pid, "running shell command", original_command)
status = os.waitpid(p.pid, 0)[1]
postnotification(p.pid, "shell command completed", original_command + " (" + str(status) + ")")
