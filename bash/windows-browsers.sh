#!/bin/bash

###################################
## You need SizeUP ( Shareware )
## https://www.irradiatedsoftware.com/sizeup/
###################################

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";
. "${_SOURCEDIR}/inc/functions.sh";

_DOTFILES_BROWSE_URL="${1}";

###################################
## Open apps
###################################

open /Applications/Google\ Chrome.app;
open /Applications/Firefox.app;
open /Applications/Safari.app;
open /Applications/Microsoft\ Edge\ Canary.app;

###################################
## Wait a moment
###################################

sleep 1;

###################################
## Resize
###################################

dotfiles_position_app "Google Chrome" ${dotfiles_position_left_monitor_id} "do action Left";
dotfiles_browser_go_to_url "Google Chrome" "${_DOTFILES_BROWSE_URL}";

dotfiles_position_app "Firefox" ${dotfiles_position_left_monitor_id} "do action Right";
dotfiles_browser_go_to_url "Firefox" "${_DOTFILES_BROWSE_URL}";

dotfiles_position_app "Safari" ${dotfiles_position_right_monitor_id} "do action Left";
dotfiles_browser_go_to_url "Safari" "${_DOTFILES_BROWSE_URL}";

dotfiles_position_app "Microsoft Edge Canary" ${dotfiles_position_right_monitor_id} "do action Right";
dotfiles_browser_go_to_url "Microsoft Edge Canary" "${_DOTFILES_BROWSE_URL}";
