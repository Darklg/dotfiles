#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## http://www.irradiatedsoftware.com/sizeup/
###################################

###################################
## First, manually open all apps
###################################

open /Applications/Utilities/Terminal.app;
open /Applications/Tower.app;
open /Applications/Google\ Chrome.app;
open /Applications/Mail.app;
open /Applications/Trello.app;
open /Applications/Todoist.app;
open /Applications/Slack.app;
open /Applications/Sublime\ Text.app;

###################################
## Too fast cowboy, wait a moment
###################################

sleep 1;

###################################
## Set position for an app
## This should not be edited.
###################################

dotfiles_position_app () {
   osascript <<EOF
tell application "$1"
   activate
   -- Send to correct monitor
   tell application "SizeUp" to send to monitor $2
   -- Wait a moment ...
   delay 0.1
   -- Position app
   tell application "SizeUp" to $3
   -- Wait a moment ...
   delay 0.3
end tell
EOF
}

###################################
## Position the apps
###################################

# Left Screen
dotfiles_position_app "Terminal" 3 "do action Upper Left";
dotfiles_position_app "Tower" 3 "do action Lower Left";
dotfiles_position_app "Google Chrome" 3 "do action Right";

# Right Screen
dotfiles_position_app "Mail" 2 "do action Left";
dotfiles_position_app "Todoist" 2 "move and resize to {1280, 0, 640, 720}";
dotfiles_position_app "Trello" 2 "move and resize to {1920, 0, 640, 720}";
dotfiles_position_app "Slack" 2 "do action Lower Right";

# Middle Screen
dotfiles_position_app "Sublime Text" 1 "do action Full Screen";

###################################
## It's over !
###################################

osascript <<EOF
tell app "System Events"
    display alert "Please work"
end tell
EOF

