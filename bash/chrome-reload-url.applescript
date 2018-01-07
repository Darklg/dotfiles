-- https://gist.github.com/mayoff/1138816
tell application "Google Chrome"
	activate
	set theUrl to URL of active tab of first window

	if (count every window) = 0 then
		make new window
	end if

	set found to false
	set theTabIndex to -1
	repeat with theWindow in every window
		set theTabIndex to 0
		repeat with theTab in every tab of theWindow
			set theTabIndex to theTabIndex + 1
			if theTab's URL = theUrl then
				set found to true
				exit repeat
			end if
		end repeat

		if found then
			exit repeat
		end if
	end repeat

	if found then
		tell theTab to reload
		set theWindow's active tab index to theTabIndex
		set index of theWindow to 1
	else
		tell window 1 to make new tab with properties {URL:theUrl}
	end if

	set isloading to 1
	repeat while isloading is not false
		tell application "Google Chrome"
			set isloading to loading of active tab of window 1
		end tell
	end repeat

	return

end tell
