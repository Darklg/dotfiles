#!/bin/bash

###################################
## Homebrew
###################################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Modules
brew install atomicparsley;
brew install autojump;
brew install composer;
brew install coreutils;
brew install curl;
brew install curlftpfs;
brew install diff-so-fancy;
brew install ffmpeg;
brew install git;
brew install htop;
brew install imagemagick;
brew install jq;
brew install mas;
brew install m-cli;
brew install phpunit;
brew install qlimagesize;
brew install qlvideo;
brew install redis;
brew install shellcheck;
brew install shfmt;
brew install speedtest-cli;
brew install switchaudio-osx;
brew install tree;
brew install wget;
brew install xcodes;
brew install yt-dlp;

#####################
# Cask : Software
#####################

export HOMEBREW_CASK_OPTS=--appdir=/Applications;

# Utilities
brew install --cask 1password;
brew install --cask alcove;
brew install --cask airbuddy;
brew install --cask android-platform-tools;
brew install --cask apparency;
brew install --cask appcleaner;
brew install --cask bettertouchtool;
brew install --cask calibre;
brew install --cask coconutbattery;
brew install --cask handbrake;
brew install --cask keyboardcleantool;
brew install --cask kdrive;
brew install --cask macdown;
brew install --cask maestral;
brew install --cask obsidian;
brew install --cask onyx;
brew install --cask raycast;
brew install --cask setapp;
brew install --cask selfcontrol;
brew install --cask silentknight;
brew install --cask suspicious-package;
brew install --cask timemachineeditor;
brew install --cask the-unarchiver;
brew install --cask tunnelbear;
brew install --cask tunnelblick;

# Work
brew install --cask chatgpt;
brew install --cask claude;
brew install --cask figma;
brew install --cask imageoptim;
brew install --cask insomnia;
brew install --cask inkscape;
brew install --cask orbstack;
brew install --cask poedit;
brew install --cask postman;
brew install --cask responsively;
brew install --cask sublime-text;
brew install --cask svgcleaner;
brew install --cask textexpander;
brew install --cask tower;
brew install --cask transmit;

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
