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
brew install casperjs;
brew install composer;
brew install curl;
brew install curlftpfs;
brew install diff-so-fancy
brew install ffmpeg;
brew install geoip;
brew install git;
brew install htop;
brew install imagemagick;
brew install mackup;
brew install mas;
brew install phantomjs;
brew install phplint;
brew install phpunit;
brew install redis;
brew install shellcheck;
brew install speedtest-cli;
brew install switchaudio-osx
brew install tree;
brew install ttfautohint fontforge --with-python
brew install webpquicklook;
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
brew install --cask calibre;
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
brew install --cask homebrew/cask-versions/java8
brew install --cask macdown;
brew install --cask onyx;
brew install --cask qlimagesize;
brew install --cask qlmarkdown;
brew install --cask qlprettypatch;
brew install --cask qlvideo;
brew install --cask quicklook-csv;
brew install --cask quicklook-json;
brew install --cask quicklookase;
brew install --cask qxmledit;
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
brew install --cask livereload;
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

# Big guyz
brew install --cask adobe-creative-cloud;
brew install --cask microsoft-office;

# Browsers
brew install --cask google-chrome;
brew install --cask google-chrome-canary;
brew install --cask firefox;
brew install --cask firefox-nightly;

# Medias
brew install --cask spotify;
brew install --cask vlc;

# Libs & stuff
brew install --cask xquartz;
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

#####################
## Gems
#####################

gem --user-install install jekyll;
gem --user-install install sass;
gem --user-install install compass;
gem --user-install install wpscan;

###################################
## xcode
###################################

xcode-select --install;

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

###################################
## Mac App Store
###################################

mas install 1147396723; # Whatsapp
mas install 1278508951; # Trello
mas install 1384080005; # Tweetbot
mas install 1388020431; # DevCleaner
mas install 1449412482; # Reeder
mas install 1518425043; # Boop
mas install 513610341;  # Integrity
mas install 568494494;  # Pocket
mas install 585829637;  # Todoist
mas install 669840342;  # Cashflows
mas install 957734279;  # TogglDesktop
mas install 1518036000  # Sequel Ace
