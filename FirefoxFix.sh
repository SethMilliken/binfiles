#!/bin/sh
# This is a script for modifying copies of Firefox to uniquely identify them.

ORIGINAL_APP_NAME="Firefox"
ORIGINAL_SIG="MOZB"
ORIGINAL_BUNDLE_ID="org.mozilla.firefox"
ICON_NAME="firefox"

function fix {
	ID=$1
	NAME="FireFox${2}"
	PATH_PREFIX=$3
	APP=$4
	ICON=$5
	FULL_PATH=${PATH_PREFIX}/${NAME}.app/Contents
	if [ -d ${FULL_PATH} ]
	then
            /usr/libexec/PlistBuddy ${FULL_PATH}/Info.plist -c 'Set :CFBundleIdentifier '${ORIGINAL_BUNDLE_ID}'.'${NAME}
            /usr/libexec/PlistBuddy ${FULL_PATH}/Info.plist -c 'Set :CFBundleName '${NAME}
            /usr/libexec/PlistBuddy ${FULL_PATH}/Info.plist -c 'Set :CFBundleSignature '${ID}
            /usr/bin/sed -i '' -es/${ORIGINAL_SIG}/${ID}/ ${FULL_PATH}/PkgInfo
            /bin/cp ~/Pictures/FireFoxIcons/${ICON} ${FULL_PATH}/Resources/FireFox.icns
        else
            echo "${FULL_PATH} not found."
            cp -Rp "${PATH_PREFIX}/${APP}.app" "${PATH_PREFIX}/${NAME}.app"
        fi
}

#fix FFBR Browse /Applications/Browse.app/Contents FirefoxBlue.icns
fix FFTS Volatile /Applications FireFox FireFoxBlue.icns
#fix FFSS Research /Applications FireFox\ 4.0 FireFoxBlue.icns
#fix FFDY Dactyl /Applications FireFox\ 4.0 FireFoxBlue.icns
