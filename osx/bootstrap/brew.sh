#!/bin/bash

###################################
## Homebrew
###################################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Add repos
brew tap "homebrew/cask"
brew tap "homebrew/cask-versions"
brew tap "homebrew/cask-fonts"

# Cask
brew install caskroom/cask/brew-cask;

# Modules
brew install atomicparsley;
brew install autojump;
brew install composer;
brew install curl;
brew install curlftpfs;
brew install diff-so-fancy;
brew install ffmpeg;
brew install geoip;
brew install git;
brew install htop;
brew install imagemagick;
brew install jq;
brew install mas;
brew install m-cli;
brew install phplint;
brew install phpunit;
brew install redis;
brew install shellcheck;
brew install shfmt;
brew install speedtest-cli;
brew install switchaudio-osx;
brew install tree;
brew install wget;
brew install xcodes;
brew install youtube-dl;

#####################
# Cask : Software
#####################

export HOMEBREW_CASK_OPTS=--appdir=/Applications;

# Utilities
brew install --cask 1password;
brew install --cask airbuddy;
brew install --cask appcleaner;
brew install --cask calibre;
brew install --cask coconutbattery;
brew install --cask dash;
brew install --cask fontplop;
brew install --cask handbrake;
brew install --cask macdown;
brew install --cask maestral;
brew install --cask obsidian;
brew install --cask onyx;
brew install --cask raycast;
brew install --cask setapp;
brew install --cask sizeup;
brew install --cask suspicious-package;
brew install --cask teamviewer;
brew install --cask timemachineeditor;
brew install --cask the-unarchiver;
brew install --cask tuck;
brew install --cask tunnelbear;
brew install --cask tunnelblick;

# Work
brew install --cask figma;
brew install --cask imagealpha;
brew install --cask imageoptim;
brew install --cask insomnia;
brew install --cask inkscape;
brew install --cask poedit;
brew install --cask postman;
brew install --cask responsively;
brew install --cask sketch;
brew install --cask sublime-text;
brew install --cask svgcleaner;
brew install --cask textexpander;
brew install --cask tower;
brew install --cask transmit;
brew install --cask zeplin;

# Browsers
brew install --cask google-chrome;
brew install --cask firefox;

# Medias
brew install --cask spotify;
brew install --cask vlc;

# Libs & stuff
brew install poppler;

###################################
## Cleanup
###################################

brew cleanup;
brew cask cleanup;
brew doctor;
