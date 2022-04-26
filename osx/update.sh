#!/bin/bash

###################################
## PHP
###################################

composer self-update;

###################################
## Node
###################################

sudo chown -R $USER:$(id -gn $USER) /Users/kevin/.config
sudo chown -R $USER /usr/local/lib/node_modules;
sudo n stable;
sudo npm install -g n;
sudo npm cache clean -f;
npm update -g;

###################################
## HOMEBREW
###################################

brew update;
brew upgrade;
brew upgrade --cask;

# CLEAN
brew cleanup;
brew doctor;
brew cleanup --prune-prefix;

###################################
## Mac
###################################

mas outdated;
mas outdated;
mas upgrade;
softwareupdate --install --all --force --verbose;
