#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## http://www.irradiatedsoftware.com/sizeup/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

# Screen settings
. "${_SOURCEDIR}/inc/functions.sh";


# Ask location
_LOCATION="home";
read -p "- Are you at home ? [Y/n] : " _LOCATION_READ
if [[ "${_LOCATION_READ}" == 'n' ]];then
    _LOCATION="office";
fi;

###################################
## First, manually open all apps
###################################

open /System/Applications/Notes.app;
open /System/Applications/Mail.app;
open /Applications/Vagrant\ Manager.app;
open /System/Applications/Utilities/Terminal.app;
open /Applications/Tower.app;
open /Applications/Google\ Chrome.app;
open /Applications/Trello.app;
open /Applications/Todoist.app;
open /Applications/Slack.app;
open /Applications/Sublime\ Text.app;
open /System/Applications/Messages.app

###################################
## Too fast cowboy, wait a moment
###################################

sleep 1;

###################################
## Position the apps
###################################

if [[ "${_LOCATION}" == "office" ]];then

    # Left Screen
    dotfiles_position_app "Notes" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 640, 708}";
    dotfiles_position_app "Terminal" ${dotfiles_position_left_monitor_id} "move and resize to {640, 0, 640, 708}";
    dotfiles_position_app "Tower" ${dotfiles_position_left_monitor_id} "do action Lower Left";
    dotfiles_position_app "Google Chrome" ${dotfiles_position_left_monitor_id} "do action Right";

    # Right Screen
    dotfiles_position_app "Mail" ${dotfiles_position_right_monitor_id} "do action Left";
    dotfiles_position_app "Todoist" ${dotfiles_position_right_monitor_id} "move and resize to {1280, 0, 640, 970}";
    dotfiles_position_app "Trello" ${dotfiles_position_right_monitor_id} "move and resize to {1920, 0, 640, 490}";
    dotfiles_position_app "Messages" ${dotfiles_position_right_monitor_id} "move and resize to {1920, 491, 640, 480}";
    dotfiles_position_app "Slack" ${dotfiles_position_right_monitor_id}  "move and resize to {1280, 970, 1280, 450}";

    # Middle Screen
    dotfiles_position_app "Sublime Text" 1 "do action Full Screen";

else
    # Left Screen
    dotfiles_position_app "Todoist" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 540, 600}";
    dotfiles_position_app "Trello" ${dotfiles_position_left_monitor_id} "move and resize to {540, 0, 540, 600}";
    dotfiles_position_app "Messages" ${dotfiles_position_left_monitor_id} "move and resize to {0, 600, 880, 400}";
    dotfiles_position_app "Slack" ${dotfiles_position_left_monitor_id} "move and resize to {200, 600, 880, 400}";
    dotfiles_position_app "Terminal" ${dotfiles_position_left_monitor_id} "move and resize to {0, 1000, 1080, 420}";
    dotfiles_position_app "Tower" ${dotfiles_position_left_monitor_id} "move and resize to {0, 1420, 980, 480}";
    dotfiles_position_app "Notes" ${dotfiles_position_left_monitor_id} "move and resize to {100, 1420, 980, 480}";

    # Right Screen
    dotfiles_position_app "Google Chrome" 1 "do action Left";
    dotfiles_position_app "Mail" 1 "do action Right";


    # Middle Screen
    dotfiles_position_app "Sublime Text" ${dotfiles_position_right_monitor_id} "do action Full Screen";
fi;
