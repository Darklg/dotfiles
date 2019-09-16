#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## http://www.irradiatedsoftware.com/sizeup/
###################################

###################################
## First, manually open all apps
###################################

open /Applications/Utilities/Terminal.app;
open /Applications/Notes.app;
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

dotfiles_position_left_monitor_id=3;
dotfiles_position_right_monitor_id=2;

###################################
## Position the apps
###################################

# Left Screen
dotfiles_position_app "Notes" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 640, 708}";
dotfiles_position_app "Terminal" ${dotfiles_position_left_monitor_id} "move and resize to {640, 0, 640, 708}";
dotfiles_position_app "Tower" ${dotfiles_position_left_monitor_id} "do action Lower Left";
dotfiles_position_app "Google Chrome" ${dotfiles_position_left_monitor_id} "do action Right";

# Right Screen
dotfiles_position_app "Mail" ${dotfiles_position_right_monitor_id} "do action Left";
dotfiles_position_app "Todoist" ${dotfiles_position_right_monitor_id} "move and resize to {1280, 0, 640, 708}";
dotfiles_position_app "Trello" ${dotfiles_position_right_monitor_id} "move and resize to {1920, 0, 640, 708}";
dotfiles_position_app "Slack" ${dotfiles_position_right_monitor_id} "do action Lower Right";

# Middle Screen
dotfiles_position_app "Sublime Text" 1 "do action Full Screen";

###################################
## It's over !
###################################

# osascript <<EOF
# tell app "System Events"
#     display alert "Please work"
# end tell
# EOF

