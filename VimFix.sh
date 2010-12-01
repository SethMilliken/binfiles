#!/bin/sh
# This is a script for modifying copies of MacVim to uniquely identify them.

function vimfix {
	ID=$1
	NAME=$2
	PATH=$3
	ICON=$4
	/usr/libexec/PlistBuddy ${PATH}/Info.plist -c 'Set :CFBundleIdentifier org.vim.MacVim.'${NAME}
	/usr/libexec/PlistBuddy ${PATH}/Info.plist -c 'Set :CFBundleName '${NAME}
	/usr/libexec/PlistBuddy ${PATH}/Info.plist -c 'Set :CFBundleSignature '${ID}
	/usr/bin/sed -i '' -es/VIMM/${ID}/ ${PATH}/PkgInfo
	/bin/cp ~/Pictures/VimIcons/${ICON} ${PATH}/Resources/MacVim.icns
}

vimfix VIM7 SourceCode /Applications/SourceCode.app/Contents VimBlue.icns
vimfix VIM6 Research /Applications/Research.app/Contents VimGrey.icns
vimfix VIM5 Tasks /Applications/Tasks.app/Contents VimPurple.icns
vimfix VIM4 Vimwiki /Applications/Vimwiki.app/Contents VimPaleGreen.icns
vimfix VIM3 Todo /Applications/Todo.app/Contents VimGreen.icns
vimfix VIMM MacVim /Applications/MacVim.app/Contents VimGreen.icns
