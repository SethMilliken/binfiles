#!/bin/sh
osascript <<END_SCRIPT
 tell application "System Events"
	set t to value of attribute "AXDescription" of menu bar items of menu bar 1 of application process "SystemUIServer" as list
	set menuExtraName to "AppleScript"
	repeat with i from 1 to count of items in t
		set this_item to item i of t
		if this_item is menuExtraName then
			click menu bar item i of menu bar 1 of application process "SystemUIServer"
			exit repeat
		end if
	end repeat
end tell
END_SCRIPT
