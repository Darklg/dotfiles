#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## https://www.irradiatedsoftware.com/sizeup/
## And Tuck ( Shareware )
## https://www.irradiatedsoftware.com/tuck/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";


# Get Wi-Fi name
_WIFI_NAME=$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F: '/ SSID/{print $2}' | xargs);

# Screen settings
. "${_SOURCEDIR}/inc/functions.sh";
. "${_SOURCEDIR}/windows-local.sh";

if [[ -z "${_OFFICE_WIFI}" ]];then
    echo '- OFFICE_WIFI is not defined !';
fi;

# Get music status
_MUSIC_IS_PLAYING="0";
if [[ "$(pmset -g | grep ' sleep')" == *"coreaudiod"* ]]; then
    echo '- Music is already playing';
    _MUSIC_IS_PLAYING="1";
fi;

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
- 2 : Home / Office ?
[1/2]
EOF
);

# Ask location
read -p "${_QUESTION_LOC} : " _LOCATION_READ
if [[ "${_LOCATION_READ}" == '1' ]];then
    _LOCATION="onthego";
fi;
if [[ "${_LOCATION_READ}" == '2' ]];then
    _LOCATION="office";
fi;

echo "# Activated mode : “${_LOCATION}”";

###################################
## First, manually open all apps
###################################

open /Applications/Todoist.app;
open /System/Applications/Utilities/Terminal.app;
open /Applications/Google\ Chrome.app;
open /Applications/Sublime\ Text.app;

if [[ "${_LOCATION}" != 'onthego' ]];then
    open /Applications/Tower.app;
    open /System/Applications/Notes.app;
    open /Applications/Goofy.app;
    open /Applications/TogglDesktop.app;
    open /Applications/Spotify.app;
    open /Applications/Slack.app;
    open /System/Applications/Mail.app;
    open /Applications/Trello.app;
    open /System/Applications/Messages.app;
    open /System/Applications/Reminders.app;
fi;

###################################
## Too fast cowboy, wait a moment
###################################

sleep 1.5;

###################################
## Sound
###################################

echo "# Sound Settings";

_DF_AUDIO_SOURCES=$(SwitchAudioSource -a);

# Switch audio sources
if [[ $_DF_AUDIO_SOURCES = *QuietComfort* ]]; then
    osascript -e 'set volume output volume 40';
    SwitchAudioSource -t input -s 'Bose QuietComfort 35';
    SwitchAudioSource -t output -s 'Bose QuietComfort 35';
elif [[ $_DF_AUDIO_SOURCES = *Realtek\ USB* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'Micro MacBook Pro';
    SwitchAudioSource -t output -s 'Realtek USB2.0 Audio';
elif [[ $_DF_AUDIO_SOURCES = *AirPods\ Pro* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'AirPods Pro de Kévin';
    SwitchAudioSource -t output -s 'AirPods Pro de Kévin';
elif [[ $_DF_AUDIO_SOURCES = *AirPods\ Max* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'AirPods Max de Kévin';
    SwitchAudioSource -t output -s 'AirPods Max de Kévin';
elif [[ $_DF_AUDIO_SOURCES = *Écouteurs\ externes* ]]; then
    osascript -e 'set volume output volume 30';
    SwitchAudioSource -t output -s 'Écouteurs externes';
    SwitchAudioSource -t input -s 'Micro MacBook Pro';
else
    osascript -e 'set volume output volume 20';
    SwitchAudioSource -t output -s 'Haut-parleurs MacBook Pro';
    SwitchAudioSource -t input -s 'Micro MacBook Pro';
fi;

###################################
## Position the apps
###################################

echo "# Windows Settings";
if [[ "${_LOCATION}" == "onthego" ]];then

    # Left Screen
    dotfiles_position_app "Sublime Text" 1 "move and resize to {0, 0, 1680, 1025}";

    # Right Screen
    dotfiles_position_app "Google Chrome" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1280, 1200}";
    dotfiles_position_app "Todoist" ${dotfiles_position_right_monitor_id} "move and resize to {1281, 0, 639, 530}";
    dotfiles_position_app "Terminal" ${dotfiles_position_right_monitor_id} "move and resize to {1281, 531, 639, 530}";

fi;

if [[ "${_LOCATION}" != "onthego" ]];then

    # Left Screen
    dotfiles_position_app "TogglDesktop" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 960, 548}";
    dotfiles_position_app "Terminal" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 960, 548}";
    dotfiles_position_app "Tower" ${dotfiles_position_left_monitor_id} "move and resize to {0, 549, 960, 866}";
    dotfiles_position_app "Todoist" ${dotfiles_position_left_monitor_id} "move and resize to {0, 549, 960, 866}";
    dotfiles_position_app "Google Chrome" ${dotfiles_position_left_monitor_id} "move and resize to {961, 0, 1600, 1416}";

    # Right Screen
    dotfiles_position_app "Mail" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1600, 1416}";
    dotfiles_position_app "Notes" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 0, 960, 708}";
    dotfiles_position_app "Trello" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 0, 960, 708}";
    dotfiles_position_app "Reminders" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 0, 960, 708}";
    dotfiles_position_app "Messages" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";
    dotfiles_position_app "Slack" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";
    dotfiles_position_app "Spotify" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";

    # Middle Screen
    # dotfiles_position_tuck_app "Trello" 1 "left";
    # dotfiles_position_tuck_app "Todoist" 1 "right";
    dotfiles_position_app "Sublime Text" 1 "do action Full Screen";
fi;

if [[ "${_LOCATION}" == "twoscreens" ]];then

    # Left Screen
    dotfiles_position_app "TogglDesktop" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 960, 548}";
    dotfiles_position_app "Trello" ${dotfiles_position_left_monitor_id} "move and resize to {0, 0, 960, 548}";
    dotfiles_position_app "Tower" ${dotfiles_position_left_monitor_id} "move and resize to {0, 549, 960, 866}";
    dotfiles_position_app "Todoist" ${dotfiles_position_left_monitor_id} "move and resize to {0, 549, 960, 866}";
    dotfiles_position_app "Google Chrome" ${dotfiles_position_left_monitor_id} "move and resize to {961, 0, 1600, 1416}";

    # Right Screen
    dotfiles_position_app "Mail" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1600, 1416}";
    dotfiles_position_app "Terminal" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 0, 960, 708}";
    dotfiles_position_app "Messages" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";
    dotfiles_position_app "Slack" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";
    dotfiles_position_app "Spotify" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";
    dotfiles_position_app "Notes" ${dotfiles_position_right_monitor_id} "move and resize to {1600, 708, 960, 708}";

    # Middle Screen
    # dotfiles_position_tuck_app "Trello" 1 "left";
    # dotfiles_position_tuck_app "Todoist" 1 "right";
    dotfiles_position_app "Sublime Text" ${dotfiles_position_right_monitor_id} "move and resize to {0, 0, 1600, 1416}";
fi;

if [[ "${_MUSIC_IS_PLAYING}" == '0' && "${_LOCATION}" != "onthego" ]]; then
    osascript <<EOF
tell application "Spotify"
    if shuffling is false then
        set shuffling to true
    end if
    play track "spotify:playlist:0V8a5mT63fx7RrLmbFXtA1"
    next track
end tell
EOF
fi;

echo "# Success ! Let’s work !";
