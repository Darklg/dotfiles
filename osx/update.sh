#!/bin/bash

###################################
## PHP
###################################

composer self-update;

###################################
## Node
###################################

sudo npm install -g n;
sudo npm cache clean -f;
sudo n stable;

###################################
## NPM
###################################

npm update -g;
npm install -g npm;

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
brew cask upgrade;

# CLEAN
brew cleanup;
brew doctor;
brew cleanup --prune-prefix;

###################################
## Microsoft Office
###################################

/Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install

###################################
## Mac
###################################

softwareupdate --install --all --force --verbose;
