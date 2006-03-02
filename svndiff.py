#!/usr/bin/python

from sys import argv
from os import execlp
import re


left = "";
right = "";

argv.pop(0)

while argv:
    arg = argv.pop(0)
    if arg == "-u":
        pass
    elif arg == "-L":
        argv.pop(0)
    elif left == "":
        left = arg
    else:
        right = arg

execlp("opendiff", "opendiff", left, right)
