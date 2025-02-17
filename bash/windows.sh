#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## https://www.irradiatedsoftware.com/sizeup/
## And Tuck ( Shareware )
## https://www.irradiatedsoftware.com/tuck/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";


# Get Wi-Fi name
_WIFI_NAME=$(networksetup -getairportnetwork en0 | cut -c 24-);

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

echo "- Wifi name: ${_WIFI_NAME}";

# Detect location
_LOCATION="";
if [[ "${_WIFI_NAME}" == "${_HOME_WIFI}" ]];then
    _LOCATION="home";
    # Invert monitors
    _tmp_monitor_id="${dotfiles_position_left_monitor_id}";
    dotfiles_position_left_monitor_id="${dotfiles_position_right_monitor_id}";
    dotfiles_position_right_monitor_id="${_tmp_monitor_id}";
fi;
if [[ "${_WIFI_NAME}" == "${_OFFICE_WIFI}" ]];then
    _LOCATION="office";
fi;

if [[ "${_LOCATION}" != '' ]];then
    echo "# Detected location : “${_LOCATION}”";
else
    _LOCATION="office";
fi;

_QUESTION_LOC=$(cat <<EOF
- Where are you ?
- 1 : Home / Office ?
- 2 : On the go ?
- 3 : Two screens (up and down) ?
- 4 : Two screens ?
[1/2/3/4]
EOF
);

# Ask location
read -p "${_QUESTION_LOC} : " _LOCATION_READ
if [[ "${_LOCATION_READ}" == '1' ]];then
    _LOCATION="office";
fi;
if [[ "${_LOCATION_READ}" == '2' ]];then
    _LOCATION="onthego";
fi;
if [[ "${_LOCATION_READ}" == '3' ]];then
    _LOCATION="twoscreensup";
fi;
if [[ "${_LOCATION_READ}" == '4' ]];then
    _LOCATION="twoscreens";
fi;

echo "# Activated mode : “${_LOCATION}”";

###################################
## First, manually open all apps
###################################

open /Applications/SelfControl.app;
open /Applications/Figma.app;
open /Applications/Todoist.app;
open /System/Applications/Utilities/Terminal.app;
#open /Applications/Prompt.app;
open /Applications/Google\ Chrome.app;
open /Applications/Sublime\ Text.app;
open /Applications/Visual\ Studio\ Code.app;
open /Applications/Tower.app;
open /System/Applications/Calendar.app;
open /Applications/Obsidian.app;
open /Applications/Spotify.app;
open /Applications/Slack.app;
open /System/Applications/Notes.app;
open /System/Applications/Mail.app;
open /System/Applications/Messages.app;
open /System/Applications/Stickies.app;

if [[ "${_LOCATION}" != 'onthego' ]];then
    open "/Applications/Toggl Track.app";
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
elif [[ $_DF_AUDIO_SOURCES = *EarPods* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'EarPods';
    SwitchAudioSource -t output -s 'EarPods';
elif [[ $_DF_AUDIO_SOURCES = *AirPods\ Max* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'AirPods Max de Kévin';
    SwitchAudioSource -t output -s 'AirPods Max de Kévin';
elif [[ $_DF_AUDIO_SOURCES = *AirPods\ Pro* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'AirPods Pro 2 de Kévin';
    SwitchAudioSource -t output -s 'AirPods Pro 2 de Kévin';
elif [[ $_DF_AUDIO_SOURCES = *Realtek\ USB* ]]; then
    osascript -e 'set volume output volume 50';
    SwitchAudioSource -t input -s 'Micro MacBook Pro';
    SwitchAudioSource -t output -s 'Realtek USB2.0 Audio';
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
## Display
###################################

#m display down;
#m display up;

###################################
## Position the apps
###################################

echo "# Windows Settings";
if [[ "${_LOCATION}" == "onthego" ]];then

    # Left Screen
    dotfiles_position_app "Google Chrome" "${dotfiles_position_left_monitor_id}" "do action Full Screen";

    # Right Screen
    _pos_left="{0, 0, 960, 1416}";
    dotfiles_position_app "Mail" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_left}";
    dotfiles_position_app "Calendar" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_left}";
    dotfiles_position_app "Slack" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_left}";
    dotfiles_position_app "Todoist" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_left}";

    # Up
    _pos_up="{960, 0, 960, 540}";
    dotfiles_position_app "Spotify" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_up}";
    #dotfiles_position_app "Toggl Track" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_up}";
    #dotfiles_position_app "Prompt" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_up}";
    dotfiles_position_app "Terminal" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_up}";

    # Down
    _pos_down="{960, 540, 960, 520}";
    dotfiles_position_app "Tower" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";
    dotfiles_position_app "Notes" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";
    dotfiles_position_app "Messages" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";

    # Middle Screen
    # dotfiles_position_tuck_app "Todoist" 1 "right";
    dotfiles_position_app "Sublime Text" 1 "do action Full Screen";
    dotfiles_position_app "Visual Studio Code" 1 "do action Full Screen";

fi;

if [[ "${_LOCATION}" != "onthego" && "${_LOCATION}" != "twoscreensup" ]];then
    if [[ "${_LOCATION}" == 'twoscreens' ]];then
        dotfiles_position_left_monitor_id="2";
        dotfiles_position_right_monitor_id="1";
    fi;

    # Left Screen
    dotfiles_position_app "Toggl Track" "${dotfiles_position_left_monitor_id}" "move and resize to {0, 0, 960, 548}";
    dotfiles_position_app "Terminal" "${dotfiles_position_left_monitor_id}" "move and resize to {0, 0, 960, 548}";
    #dotfiles_position_app "Prompt" "${dotfiles_position_left_monitor_id}" "move and resize to {0, 0, 960, 548}";
    dotfiles_position_app "Tower" "${dotfiles_position_left_monitor_id}" "move and resize to {0, 549, 960, 866}";
    dotfiles_position_app "Google Chrome" "${dotfiles_position_left_monitor_id}" "move and resize to {961, 0, 1600, 1416}";

    # Right Screen
    dotfiles_position_app "Mail" "${dotfiles_position_right_monitor_id}" "move and resize to {0, 0, 1600, 1416}";
    dotfiles_position_app "Obsidian" "${dotfiles_position_right_monitor_id}" "move and resize to {0, 0, 1600, 1416}";
    dotfiles_position_app "Calendar" "${dotfiles_position_right_monitor_id}" "move and resize to {0, 0, 1600, 1416}";

    # Up
    _pos_up="{1600, 0, 960, 708}";
    dotfiles_position_app "Reminders" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_up}";
    dotfiles_position_app "Todoist" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_up}";

    # Down
    _pos_down="{1600, 708, 960, 708}";
    dotfiles_position_app "Notes" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";
    dotfiles_position_app "Messages" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";
    dotfiles_position_app "Slack" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";
    dotfiles_position_app "Spotify" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_down}";

    # Middle Screen
    # dotfiles_position_tuck_app "Todoist" 1 "right";
    if [[ "${_LOCATION}" != 'twoscreens' ]];then
        dotfiles_position_app "Sublime Text" 1 "do action Full Screen";
        dotfiles_position_app "Visual Studio Code" 1 "do action Full Screen";
    else
        dotfiles_position_app "Sublime Text" "${dotfiles_position_right_monitor_id}" "move and resize to {0, 0, 1600, 1416}";
        dotfiles_position_app "Visual Studio Code" "${dotfiles_position_right_monitor_id}" "move and resize to {0, 0, 1600, 1416}";
    fi;
fi;

if [[ "${_LOCATION}" == "twoscreensup" ]];then

    dotfiles_position_left_monitor_id=2;

    # Figma in full screen
    dotfiles_position_fullscreen_app "Mail";
    dotfiles_position_fullscreen_app "Obsidian";
    dotfiles_position_fullscreen_app "Figma";

    _pos_top_left="{0, 0, 640, 548}";
    _pos_bottom_left="{0, 549, 640, 866}";
    _pos_top_right="{1920, 0, 640, 548}";
    _pos_bottom_right="{1920, 549, 640, 866}";

    # Left Side
    dotfiles_position_app "Toggl Track" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_top_left}";
    dotfiles_position_app "Slack" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_bottom_left}";
    dotfiles_position_app "Spotify" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_bottom_left}";
    dotfiles_position_app "Notes" "${dotfiles_position_right_monitor_id}" "move and resize to ${_pos_bottom_left}";
    dotfiles_position_app "Todoist" "${dotfiles_position_left_monitor_id}" "move and resize to  ${_pos_bottom_left}";
    #dotfiles_position_app "Prompt" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_top_right}";
    dotfiles_position_app "Terminal" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_top_right}";
    dotfiles_position_app "Messages" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_bottom_right}";
    dotfiles_position_app "Tower" "${dotfiles_position_left_monitor_id}" "move and resize to ${_pos_bottom_right}";

    # Right Side
    dotfiles_position_app "Google Chrome" "${dotfiles_position_left_monitor_id}" "move and resize to {640, 0, 1280, 1416}";

    # Middle Screen
    dotfiles_position_app "Sublime Text" 1 "do action Full Screen";
    dotfiles_position_app "Visual Studio Code" 1 "do action Full Screen";
fi;

_SPOTIFY_PLAYLISTS_ARRAY=(
    "spotify:playlist:7M5oPOgfC3Lq1fcMRdRdNo"
    "spotify:playlist:37i9dQZF1EP6YuccBxUcC1"
    "spotify:playlist:5r4XtPgL4O0YWiLOGACscn"
);
_RANDOM_PLAYLIST=${_SPOTIFY_PLAYLISTS_ARRAY[$RANDOM % ${#_SPOTIFY_PLAYLISTS_ARRAY[@]}]};

if [[ "${_MUSIC_IS_PLAYING}" == '0' && "${_LOCATION}" != "onthego" ]]; then
    osascript <<EOF
tell application "Spotify"
    if shuffling is false then
        set shuffling to true
    end if
    play track "${_RANDOM_PLAYLIST}"
    next track
end tell
EOF
fi;

echo "# Success ! Let’s work !";
