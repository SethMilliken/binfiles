#!/bin/bash
# automatically mount ftp filesystem somehow...
# ftp://ftp.openbsd.org/pub/OpenBSD/snapshots/zaurus/
SOURCE="/Volumes/ftp.openbsd.org/"
#DESTINATION="${HOME}/staging/zaurus/snapshot/"
DESTINATION="./snapshot/"
rsync -avz --cvs-exclude --exclude=.DS_Store --progress "${SOURCE}" "${DESTINATION}"

