#!/bin/bash

###################################
## Disable default Apache
###################################

sudo apachectl stop;
sudo launchctl unload -w /Systems/Library/LaunchDaemons/org.apache.httpd.plist;

###################################
## DNS Masq
###################################

###################################
## Apache
###################################

brew install httpd;

###################################
## PHP 7.4
###################################

brew install php@7.4;
brew unlink php;
brew link --overwrite --force php@7.4;

###################################
## MySQL
###################################

brew install mysql;

###################################
## Auto start
###################################

brew services start httpd;
brew services start php;
brew services start mysql;
