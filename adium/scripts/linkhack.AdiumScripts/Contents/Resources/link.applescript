on substitute()
	tell application "Adium"
		set activeChat to active chat
		set accountName to name of account of active chat
		set serviceName to name of service of account of active chat
		set chatName to name of active chat
		set pathPrec to "/Library/Application Support/Adium 2.0/Users/Default/Logs/"
		set fullPath to pathPrec & serviceName & "." & accountName & "/" & chatName
		set lastBit to do shell script "ls -rt $HOME" & "'" & fullPath & "'" & " | tail -1"
		set fullPath to fullPath & "/" & lastBit
		set logFile to do shell script "ls -rt $HOME" & "'" & fullPath & "'" & " | tail -1"
		set fullPath to fullPath & "/" & logFile
		set theUrl to do shell script "tail -100 $HOME" & "'" & fullPath & "'" & " | grep href= | sed -e 's/.*href=\"" & "\\([^\"]*\\)\".*/\\1/' | tail -1"
		do shell script "open " & theUrl
	end tell
end substitute
