#!/bin/bash

###################################
## PHP
###################################

composer self-update;
phpunit --self-update;

###################################
## NPM
###################################

npm update -g;
npm install -g npm;

###################################
## RUBY
###################################

gem update;
gem cleanup;

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
## Vagrant
###################################

vagrant plugin update;

###################################
## Microsoft Office
###################################

/Library/Application\ Support/Microsoft/MAU2.0/Microsoft\ AutoUpdate.app/Contents/MacOS/msupdate --install

###################################
## Mac
###################################

softwareupdate --install --all --force --verbose;
