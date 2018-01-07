#!/bin/bash

#####################
## Gems
#####################

gem install jekyll;
gem install sass;
gem install compass;

###################################
## Homebrew
###################################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Add repos
brew tap "caskroom/fonts"
brew tap "caskroom/cask"

# Cask
brew install caskroom/cask/brew-cask;

# Modules
brew install casperjs;
brew install composer;
brew install curl;
brew install curlftpfs;
brew install diff-so-fancy
brew install ffmpeg;
brew install git;
brew install homebrew/boneyard/lftp;
brew install imagemagick;
brew install mackup;
brew install phantomjs;
brew install phplint;
brew install phpunit;
brew install redis;
brew install shellcheck;
brew install speedtest-cli;
brew install tree;
brew install ttfautohint fontforge --with-python
brew install webpquicklook;
brew install wget;
brew install youtube-dl;

#####################
# Cask : Software
#####################

export HOMEBREW_CASK_OPTS=--appdir=/Applications;
brew tap caskroom/versions

# Utilities
brew cask install 1password;
brew cask install appcleaner;
brew cask install betterzipql;
brew cask install divvy;
brew cask install grandperspective;
brew cask install handbrake;
brew cask install onyx;
brew cask install osxfuse;
brew cask install qlcolorcode;
brew cask install qlmarkdown;
brew cask install qlprettypatch;
brew cask install qlstephen;
brew cask install quicklook-csv;
brew cask install quicklook-json;
brew cask install quicklookase;
brew cask install sizeup;
brew cask install skype;
brew cask install slack;
brew cask install suspicious-package;
brew cask install teamviewer;
brew cask install the-unarchiver;
brew cask install tripmode;
brew cask install tunnelbear;

# Work
brew cask install imageoptim;
brew cask install livereload;
brew cask install mamp;
brew cask install sequel-pro;
brew cask install sublime-text3;
brew cask install svg-cleaner;
brew cask install textexpander;
brew cask install todoist
brew cask install tower;
brew cask install transmit;
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

# Fonts
brew cask install font-inconsolata;

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

npm config set cache-min 9999999;

#####################
# Node modules
#####################

# grunt
command -v grunt >/dev/null 2>&1 || { npm install -g grunt-cli;npm install -g grunt; }
npm install -g speedline;

###################################
## Phar
###################################

# WP-Cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

