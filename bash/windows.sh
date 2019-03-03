#!/bin/bash


DOTFILES_ALIAS_DIR_WINDOWS=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

open /Applications/Utilities/Terminal.app;
open /Applications/Tower.app;
open /Applications/Google\ Chrome.app;
open /Applications/Mail.app;
open /Applications/Trello.app;
open /Applications/Todoist.app;
open /Applications/Slack.app;
open /Applications/Sublime\ Text.app;

osascript "${DOTFILES_ALIAS_DIR_WINDOWS}/windows.applescript";
