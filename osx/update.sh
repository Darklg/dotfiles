#!/bin/bash

###################################
## PHP
###################################

composer self-update;

###################################
## Node
###################################

sudo chown -R $USER /usr/local/lib/node_modules;
sudo n stable;
sudo npm install -g n;
sudo npm cache clean -f;
npm update -g;

###################################
## RUBY
###################################

sudo gem update;
sudo gem cleanup;

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

softwareupdate --install --all --force --verbose;
