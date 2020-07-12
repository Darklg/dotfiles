#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## http://www.irradiatedsoftware.com/sizeup/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

# Screen settings
. "${_SOURCEDIR}/inc/functions.sh";


_QUESTION_LOC=$(cat <<EOF
- Where are you ?
- 1 : On the go ?
- 2 : Home ?
- 3 : Office ?
[1/2/3] :
EOF
);

# Ask location
_LOCATION="onthego";
read -p "${_QUESTION_LOC}" _LOCATION_READ
if [[ "${_LOCATION_READ}" == '2' ]];then
    _LOCATION="home";
fi;
if [[ "${_LOCATION_READ}" == '3' ]];then
    _LOCATION="office";
fi;

###################################
## First, manually open all apps
###################################

open /System/Applications/Notes.app;
open /Applications/Todoist.app;
open /System/Applications/Utilities/Terminal.app;
open /Applications/Tower.app;
open /Applications/Google\ Chrome.app;
open /Applications/Sublime\ Text.app;

# Background Apps
open /Applications/Vagrant\ Manager.app;
open /Applications/CopyClip.app;

if [[ "${_LOCATION}" != 'onthego' ]];then
    open /Applications/Slack.app;
    open /System/Applications/Mail.app;
    open /Applications/Trello.app;
    open /System/Applications/Messages.app
fi;

###################################
## Too fast cowboy, wait a moment
###################################

sleep 1.5;

###################################
## Position the apps
###################################

if [[ "${_LOCATION}" == "onthego" ]];then

    # Left Screen
    dotfiles_position_app "Sublime Text" 1 "move and resize to {500, 0, 1420, 1200}";
    dotfiles_position_app "Todoist" 1 "move and resize to {0, 0, 500, 600}";
    dotfiles_position_app "Terminal" 1 "move and resize to {0, 601, 500, 580}";

    # Right Screen
    dotfiles_position_app "Google Chrome" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1280, 1200}";
    dotfiles_position_app "Tower" ${dotfiles_position_right_monitor_id} "move and resize to {1281, 0, 639, 560}";
    dotfiles_position_app "Notes" ${dotfiles_position_right_monitor_id} "move and resize to {1281, 561, 639, 600}";

fi;

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
fi;

if [[ "${_LOCATION}" == "office" ]];then
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
