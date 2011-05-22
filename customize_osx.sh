#!/bin/bash

#
# Apply various Mac OS X customizations.
#

# Allow spaces in filenames.
ORIGINAL_IFS=$IFS
IFS=$'\n'$'\t'

# KeyRemap4MacBook Custom Configuration
KR4MB_SOURCE=${HOME}/.kr4mb/private.xml
KR4MB_CONFIG=${HOME}/Library/Application\ Support/KeyRemap4MacBook/private.xml
if [[ -f ${KR4MB_SOURCE} ]]; then
    if [[ -f ${KR4MB_CONFIG} ]]; then
        rm ${KR4MB_CONFIG}
    fi
    ln -s ${HOME}/.kr4mb/private.xml ${KR4MB_CONFIG}
fi

# QLColorCode QuickLook Plugin
XCODE_QUICKLOOK=/Developer/Applications/Xcode.app/Contents/Library/QuickLook/SourceCode.qlgenerator
if [[ -e ${XCODE_QUICKLOOK} ]]; then
    sudo mv ${XCODE_QUICKLOOK} ${XCODE_QUICKLOOK}.disabled
fi
QLCOLORCODE=${HOME}/Library/QuickLook/QLColorCode.qlgenerator
if [[ ! -e ${QLCOLORCODE} ]]; then
   echo "Install QLColorCode: http://code.google.com/p/qlcolorcode/"
else
    ln -s ${HOME}/bin/seth.style ${HOME}/Library/QuickLook/QLColorCode.qlgenerator/Contents/Resources/highlight/share/highlight/themes/seth.style
fi


# TODO: firefox symlinks for each profile
