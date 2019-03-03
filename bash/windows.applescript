
delay 1

-- Left Screen
tell application "Terminal"
    activate
    tell application "SizeUp" to send to monitor 3
    delay 0.1
    tell application "SizeUp" to do action Upper Left
    delay 0.3
end tell
tell application "Tower"
    activate
    tell application "SizeUp" to send to monitor 3
    delay 0.1
    tell application "SizeUp" to do action Lower Left
    delay 0.3
end tell
tell application "Google Chrome"
    activate
    tell application "SizeUp" to send to monitor 3
    delay 0.1
    tell application "SizeUp" to do action Right
    delay 0.3
end tell

-- Right Screen
tell application "Mail"
    activate
    tell application "SizeUp" to send to monitor 2
    delay 0.1
    tell application "SizeUp" to do action Left
    delay 0.3
end tell
tell application "Todoist"
    activate
    tell application "SizeUp" to send to monitor 2
    delay 0.1
    tell application "SizeUp" to move and resize to {1280, 0, 640, 720}
    delay 0.3
end tell
tell application "Trello"
    activate
    tell application "SizeUp" to send to monitor 2
    delay 0.1
    tell application "SizeUp" to move and resize to {1920, 0, 640, 720}
    delay 0.3
end tell
tell application "Slack"
    activate
    tell application "SizeUp" to send to monitor 2
    delay 0.1
    tell application "SizeUp" to do action Lower Right
    delay 0.3
end tell

-- Middle Screens
tell application "Sublime Text"
    activate
    tell application "SizeUp" to send to monitor 1
    delay 0.1
    tell application "SizeUp" to do action Full Screen
    delay 0.3
end tell

-- End
tell app "System Events"
    display alert "Hello World"
end tell
