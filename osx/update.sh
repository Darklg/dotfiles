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
brew prune;

# CLEAN
brew cleanup;
brew doctor;
brew prune;

###################################
## Mac
###################################

softwareupdate --install --all --force --verbose;
