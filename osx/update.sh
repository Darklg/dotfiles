#!/bin/bash

###################################
## PHP
###################################

composer self-update;
###################################
## Permissions
###################################

sudo chown -R $USER:$(id -gn $USER) /Users/kevin/.config
sudo chown -R $USER /usr/local/lib/node_modules;
sudo chown -R $USER /opt/homebrew/lib/node_modules/;
sudo chown -R $USER /opt/homebrew/Cellar/;
sudo chown -R $USER:$(id -gn $USER)  ~/.npm
sudo chown -R $USER:$(id -gn $USER)  ~/node_modules

###################################
## Node
###################################

sudo npm install -g n;
sudo n stable;
sudo npm cache clean -f;
sudo npm update -g;

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
