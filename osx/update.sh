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

# CASK
export HOMEBREW_CASK_OPTS=--appdir=/Applications;
casks=( $(brew cask list) )

for cask in ${casks[@]}
do
    # in the first line there is version
    current="$(brew cask info $cask | sed -n '1p' | sed -n 's/^.*: \(.*\)$/\1/p')"
    installed=( $(ls /opt/homebrew-cask/Caskroom/$cask))
    if (! [[ " ${installed[@]} " == *" $current "* ]]); then
        (set -x; brew cask install $cask --force;)
    fi
done

# CLEAN
brew cleanup;
brew cask cleanup;
brew doctor;

###################################
## Backups
###################################

mackup backup;

