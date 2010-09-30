#!/bin/sh
# This is a script for modifying copies of Firefox to uniquely identify them.
#ORIGINAL_SIG="VIMM"
#ORIGINAL_BUNDLE_ID="org.vim.MacVim"
ORIGINAL_APP_NAME="Firefox"
ORIGINAL_SIG="MOZB"
ORIGINAL_BUNDLE_ID="org.mozilla.firefox"
ICON_NAME="firefox"

function fix {
	ID=$1
	NAME=$2
	PATH=$3
	ICON=$4
	/usr/libexec/PlistBuddy ${PATH}/Info.plist -c 'Set :CFBundleIdentifier '${ORIGINAL_BUNDLE_ID}'.'${NAME}
	/usr/libexec/PlistBuddy ${PATH}/Info.plist -c 'Set :CFBundleName '${NAME}
	/usr/libexec/PlistBuddy ${PATH}/Info.plist -c 'Set :CFBundleSignature '${ID}
	/usr/bin/sed -i '' -es/${ORIGINAL_SIG}/${ID}/ ${PATH}/PkgInfo
	/bin/cp ~/Pictures/${ORIGINAL_APP_NAME}Icons/${ICON} ${PATH}/Resources/${ICON_NAME}.icns
}

#fix FFBR Browse /Applications/Browse.app/Contents FirefoxBlue.icns
fix FFTS Test "/Applications/FirefoxTest.app/Contents" FirefoxBlue.icns
