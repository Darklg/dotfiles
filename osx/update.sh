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

###################################
## RUBY
###################################

gem update;

###################################
## HOMEBREW
###################################

brew update;
brew upgrade;
brew prune;

# CLEAN
brew cleanup;
brew cask cleanup;
brew doctor;
brew prune;

