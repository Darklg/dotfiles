#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## https://www.irradiatedsoftware.com/sizeup/
## And Tuck ( Shareware )
## https://www.irradiatedsoftware.com/tuck/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

# Screen settings
. "${_SOURCEDIR}/inc/functions.sh";
. "${_SOURCEDIR}/windows-local.sh";

# Get Wi-Fi name
_WIFI_NAME=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' | xargs);

# Detect location
_LOCATION="";
if [[ "${_WIFI_NAME}" == "${_HOME_WIFI}" ]];then
    _LOCATION="home";
fi;
if [[ "${_WIFI_NAME}" == "${_OFFICE_WIFI}" ]];then
    _LOCATION="office";
fi;

if [[ "${_LOCATION}" != '' ]];then
    echo "# Detected location : “${_LOCATION}”";
else
    _LOCATION="onthego";
fi;

_QUESTION_LOC=$(cat <<EOF
- Where are you ?
- 1 : On the go ?
- 2 : Home ?
- 3 : Office ?
[1/2/3]
EOF
);

# Ask location
read -p "${_QUESTION_LOC} : " _LOCATION_READ
if [[ "${_LOCATION_READ}" == '2' ]];then
    _LOCATION="home";
fi;
if [[ "${_LOCATION_READ}" == '3' ]];then
    _LOCATION="office";
fi;

echo "# Activated mode : “${_LOCATION}”";

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
    open /Applications/Spotify.app;
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
## Sound
###################################

echo "# Sound Settings";
osascript -e 'set volume output volume 20';
SwitchAudioSource -t input -s 'Micro MacBook Pro';
# Default to Internal
SwitchAudioSource -t output -s 'Haut-parleurs MacBook Pro';

# Switch to alternate if availables
SwitchAudioSource -t output -s 'Écouteurs externes';
SwitchAudioSource -t input -s 'Bose QuietComfort 35';
SwitchAudioSource -t output -s 'Bose QuietComfort 35';

###################################
## Position the apps
###################################

echo "# Windows Settings";
if [[ "${_LOCATION}" == "onthego" ]];then

    # Left Screen
    dotfiles_position_app "Sublime Text" 1 "move and resize to {500, 0, 1420, 1200}";
    dotfiles_position_app "Todoist" 1 "move and resize to {0, 0, 500, 600}";
    dotfiles_position_app "Terminal" 1 "move and resize to {0, 601, 500, 580}";

    # Right Screen
    dotfiles_position_app "Google Chrome" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1280, 1200}";
    dotfiles_position_app "Tower" ${dotfiles_position_right_monitor_id} "move and resize to {1281, 0, 639, 530}";
    dotfiles_position_app "Notes" ${dotfiles_position_right_monitor_id} "move and resize to {1281, 531, 639, 530}";

fi;

if [[ "${_LOCATION}" == "office" ]];then

    # Left Screen
    dotfiles_position_app "Terminal" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 960, 708}";
    dotfiles_position_app "Tower" ${dotfiles_position_left_monitor_id} "move and resize to {0, 709, 960, 708}";
    dotfiles_position_app "Google Chrome" ${dotfiles_position_left_monitor_id} "move and resize to {961, 0, 1600, 1416}";

    # Right Screen
    dotfiles_position_app "Mail" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1600, 1416}";
    dotfiles_position_app "Notes" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 0, 960, 420}";
    dotfiles_position_app "Messages" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 421, 960, 340}";
    dotfiles_position_app "Spotify" ${dotfiles_position_right_monitor_id}  "move and resize to {1600, 761, 960, 655}";
    dotfiles_position_app "Slack" ${dotfiles_position_right_monitor_id}  "move and resize to {1600, 761, 960, 655}";

    # Middle Screen
    dotfiles_position_tuck_app "Trello" 1 "left";
    dotfiles_position_tuck_app "Todoist" 1 "right";
    dotfiles_position_app "Sublime Text" 1 "do action Full Screen";
fi;

if [[ "${_LOCATION}" == "home" ]];then
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

echo "# Success ! Let’s work !";
