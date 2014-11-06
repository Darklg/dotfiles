#!/bin/bash

#####################
# Homebrew
#####################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Modules
main_commands="git wget curl";
for i in $main_commands
do
    command -v "$i" >/dev/null 2>&1 || { brew install "${i}"; }
done;

# Cask
export HOMEBREW_CASK_OPTS=--appdir=/Applications;
brew install caskroom/cask/brew-cask;
cask_list="flux appcleaner google-chrome-canary xquartz firefox firefox-nightly spotify vlc";
for i in $cask_list
do
    brew cask install "$i";
done;

# Cleanup
brew cleanup;
brew cask cleanup;


#####################
# Node
#####################

# Install
command -v node >/dev/null 2>&1 || { brew install node; }

# Update
npm update -g --quiet;

#####################
# Node modules
#####################

# Install grunt
command -v grunt >/dev/null 2>&1 || { npm install -g grunt-cli; }
