#!/bin/bash

###################################
##  Position apps
###################################

dotfiles_position_app () {
   osascript <<EOF
tell application "$1"
   activate
   -- Send to correct monitor
   tell application "SizeUp" to send to monitor $2
   -- Wait a moment ...
   delay 0.2
   -- Position app
   tell application "SizeUp" to $3
   -- Wait a moment ...
   delay 0.3
end tell
EOF
echo "- $1";
}

dotfiles_position_tuck_app () {
   _KEYSTROKE_LETTER='j';
   if [[ "${3}" == 'right' ]];then
      _KEYSTROKE_LETTER='k';
   fi;
   osascript <<EOF
tell application "$1"
   activate
   -- Send to correct monitor
   tell application "SizeUp" to send to monitor $2
   -- Wait a moment ...
   delay 0.1
   -- Position app
   tell application "SizeUp" to move and resize to {0, 0, 640, 1180}
   -- Wait a moment ...
   delay 0.3
   -- Tuck app
   tell application "System Events"
       keystroke "${_KEYSTROKE_LETTER}" using {control down, option down, command down}
   end tell
   -- Wait a moment ...
   delay 0.3
end tell
EOF
echo "- $1";
}

# Go to browser URL
dotfiles_browser_go_to_url () {
   osascript <<EOF
tell application "$1"
    open location "$2"
end tell
EOF
}

dotfiles_position_fullscreen_app() {
    # App in full screen
    osascript <<EOF
    -- Wait a moment ...
    delay 0.3
    tell application "$1" to activate
    delay 0.3
    tell application "System Events"
        keystroke "f" using {command down, control down}
    end tell
    -- Wait a moment ...
    delay 0.3
EOF
}
