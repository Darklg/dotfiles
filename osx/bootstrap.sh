#!/bin/bash

###################################
## Homebrew
###################################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Modules
brew install caskroom/cask/brew-cask;
brew install curl;
brew install git;
brew install imagemagick;
brew install ttfautohint fontforge --with-python
brew install wget;

#####################
# Cask : Software
#####################

export HOMEBREW_CASK_OPTS=--appdir=/Applications;
brew tap caskroom/versions

# Utilities
brew cask install appcleaner;
brew cask install disk-inventory-x;
brew cask install divvy;
brew cask install dropbox;
brew cask install evernote;
brew cask install flux;
brew cask install handbrake;
brew cask install onyx;
brew cask install selfcontrol;
brew cask install skype;
brew cask install slack;
brew cask install spectacle;
brew cask install the-unarchiver;
brew cask install tripmode;
brew cask install teamviewer;

# Work
brew cask install imageoptim;
brew cask install mamp;
brew cask install sequel-pro;
brew cask install sourcetree;
brew cask install sublime-text3;
brew cask install svgcleaner;
brew cask install textexpander;
brew cask install vagrant-manager;
brew cask install vagrant;
brew cask install virtualbox-extension-pack;
brew cask install virtualbox;

# Browsers
brew cask install google-chrome;
brew cask install google-chrome-canary;
brew cask install firefox;
brew cask install firefox-nightly;

# Medias
brew cask install spotify;
brew cask install vlc;

# Libs & stuff
brew cask install xquartz;

###################################
## Cleanup
###################################

brew cleanup;
brew cask cleanup;

###################################
## Node
###################################

# Install
command -v node >/dev/null 2>&1 || { brew install node; }

# Update
npm update -g --quiet;

#####################
# Node modules
#####################

# Install grunt
command -v grunt >/dev/null 2>&1 || { npm install -g grunt-cli; }
