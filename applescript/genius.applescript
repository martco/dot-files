tell application "System Events" to set isUIScriptingEnabled to UI elements enabled
if isUIScriptingEnabled = false then
	tell application "System Preferences"
		activate
		set current pane to pane "com.apple.preference.universalaccess"
		display dialog "Your system is not properly configured to run this script. Please select the Â
		\"Enable access for assistive devices\" checkbox and trigger the script again to proceed."
		return
	end tell
end if

tell application "iTunes"
	activate
	if player state is playing then
		tell application "System Events" to keystroke "l" using command down
		set the_song to the current track
		play the_song
	end if
end tell

tell application "System Events"
	tell process "iTunes"
		repeat with the_button in every button of window 1
			set the_props to properties of the_button
			if description of the_props is "genius" then
				click the_button
				return
			end if
		end repeat
	end tell
end tell