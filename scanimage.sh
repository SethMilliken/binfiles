#!/bin/tcsh
# DVD Case 1600x2300 px
#scanimage --format=tiff -y 194.8 -x 135.5 -l 0 -t 0 --resolution 300 -p --preview=yes -v >! test.tiff
# l trims from the right
# t trims from the top
# play with l and t values
rm test2.tiff
# DVD Case exact fit
#scanimage --format=tiff -y 185 -x 129.9 -l 0 -t 4.8 --resolution 300 -p --preview=no -v >! test2.tiff
# DVD Case compromise
scanimage --format=tiff -y 185 -x 130 -l 0 -t 4.8 --resolution 300 -p --preview=no -v >! test2.tiff
