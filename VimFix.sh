#!/bin/sh
# This is a script for modifying copies of MacVim to uniquely identify them.

function vimfix {
	ID=$1
	NAME=$2
	PATH_PREFIX=$3
	ICON=$4
	FULL_PATH=${PATH_PREFIX}/${NAME}.app/Contents
	if [ -d ${FULL_PATH} ]
	then
		/usr/libexec/PlistBuddy ${FULL_PATH}/Info.plist -c 'Set :CFBundleIdentifier org.vim.MacVim.'${NAME}
		/usr/libexec/PlistBuddy ${FULL_PATH}/Info.plist -c 'Set :CFBundleName '${NAME}
		/usr/libexec/PlistBuddy ${FULL_PATH}/Info.plist -c 'Set :CFBundleSignature '${ID}
		/usr/bin/sed -i '' -es/VIMM/${ID}/ ${FULL_PATH}/PkgInfo
		/bin/cp ~/Pictures/MacVimIcons/${ICON} ${FULL_PATH}/Resources/MacVim.icns
	else
		echo "${FULL_PATH} not found."
		cp -Rp "${PATH_PREFIX}/MacVim.app" "${PATH_PREFIX}/${NAME}.app"
	fi
}

vimfix VIM3 Todo /Applications VimGreen.icns
vimfix VIM4 Vimwiki /Applications VimPaleGreen.icns
vimfix VIM5 Tasks /Applications VimPurple.icns
vimfix VIM6 Research /Applications VimGrey.icns
vimfix VIM7 SourceCode /Applications VimBlue.icns
vimfix VIM8 Scratch /Applications VimOrange.icns
vimfix VIMA AdiumVim /Applications VimOrange.icns
vimfix VIMC ColloquyVim  /Applications VimOrange.icns
vimfix VIMH VimHelp /Applications VimGrey.icns
vimfix VIMM MacVim /Applications VimGreen.icns
vimfix VIMT TwitVim /Applications VimBlue.icns
