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
brew cask install 1password;
brew cask install appcleaner;
brew cask install betterzip;
brew cask install coconutbattery;
brew cask install dash;
brew cask install divvy;
brew cask install fluid;
brew cask install fontplop;
brew cask install free-ruler;
brew cask install goofy;
brew cask install grandperspective;
brew cask install handbrake;
brew cask install homebrew/cask-versions/java8
brew cask install macdown;
brew cask install onyx;
brew cask install osxfuse;
brew cask install qlcolorcode;
brew cask install qlimagesize;
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
brew cask install imagealpha;
brew cask install imageoptim;
brew cask install livereload;
brew cask install mamp;
brew cask install poedit;
brew cask install sequel-pro;
brew cask install sketch;
brew cask install sublime-text;
brew cask install svgcleaner;
brew cask install textexpander;
brew cask install tower;
brew cask install transmit;
brew cask install vagrant-manager;
brew cask install vagrant;
brew cask install virtualbox-extension-pack;
brew cask install virtualbox;

# Big guyz
brew cask install adobe-creative-cloud;
brew cask install microsoft-office;

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
brew cask install pdftotext;

# Fonts
brew cask install font-inconsolata;
brew cask install font-ubuntu;
brew cask install font-ubuntu-mono-derivative-powerline;

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

mas install 669840342; # Cashflows
mas install 957734279; # TogglDesktop
mas install 1278508951; # Trello
mas install 585829637; # Todoist
mas install 1449412482; # Reeder
mas install 568494494; # Pocket
mas install 1518425043; # Boop
