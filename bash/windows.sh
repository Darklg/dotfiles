#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## http://www.irradiatedsoftware.com/sizeup/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

# Screen settings
. "${_SOURCEDIR}/inc/functions.sh";

###################################
## First, manually open all apps
###################################

open /System/Applications/Utilities/Terminal.app;
open /System/Applications/Notes.app;
open /Applications/Tower.app;
open /Applications/Google\ Chrome.app;
open /System/Applications/Mail.app;
open /Applications/Trello.app;
open /Applications/Todoist.app;
open /Applications/Slack.app;
open /Applications/Sublime\ Text.app;

###################################
## Too fast cowboy, wait a moment
###################################

sleep 1;

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
