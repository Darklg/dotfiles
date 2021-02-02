#!/bin/bash

###################################
## Homebrew
###################################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Install ruby
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile;
export PATH="/usr/local/opt/ruby/bin:$PATH"


# Add repos
brew tap "homebrew/cask"
brew tap "homebrew/cask-versions"
brew tap "homebrew/cask-fonts"

# Cask
brew install caskroom/cask/brew-cask;

# Modules
brew install atomicparsley;
brew install autojump;
brew install composer;
brew install curl;
brew install curlftpfs;
brew install diff-so-fancy;
brew install ffmpeg;
brew install geoip;
brew install git;
brew install htop;
brew install imagemagick;
brew install mackup;
brew install shellcheck;
brew install speedtest-cli;
brew install switchaudio-osx;
brew install tree;
brew install ttfautohint fontforge --with-python;
brew install wget;
brew install youtube-dl;

#####################
# Cask : Software
#####################

export HOMEBREW_CASK_OPTS=--appdir=/Applications;

# Utilities
brew install --cask 1password;
brew install --cask appcleaner;
brew install --cask betterzip;
brew install --cask coconutbattery;
brew install --cask copyq;
brew install --cask dash;
brew install --cask divvy;
brew install --cask fluid;
brew install --cask fontplop;
brew install --cask free-ruler;
brew install --cask goofy;
brew install --cask grandperspective;
brew install --cask hazel;
brew install --cask handbrake;
brew install --cask macdown;
brew install --cask sizeup;
brew install --cask skype;
brew install --cask slack;
brew install --cask suspicious-package;
brew install --cask teamviewer;
brew install --cask the-unarchiver;
brew install --cask tuck;
brew install --cask tunnelbear;
brew install --cask tunnelblick;

# Work
brew install --cask imagealpha;
brew install --cask imageoptim;
brew install --cask inkscape;
brew install --cask poedit;
brew install --cask postman;
brew install --cask responsively;
brew install --cask sequel-pro;
brew install --cask sketch;
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
brew install --cask pdftotext;

# Fonts
brew install --cask font-inconsolata;
brew install --cask font-ubuntu;
brew install --cask font-ubuntu-mono-derivative-powerline;

###################################
## Cleanup
###################################

brew cleanup;
brew cask cleanup;
brew doctor;

###################################
## Node
###################################

# Install
command -v node >/dev/null 2>&1 || { brew install node; }

# Update
npm update -g --quiet;

# Config
npm config set cache-min 9999999;

#####################
# Node modules
#####################

# Speedline
npm install -g speedline;

# Gulp
npm install --global gulp-cli

###################################
## Phar
###################################

# WP-Cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp
