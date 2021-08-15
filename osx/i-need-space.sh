#!/bin/bash

function ineedspace_available(){
    echo "Available space :" $(df -h "."  | awk 'NR==2{print $4}');
}

###################################
## Debug
###################################

ineedspace_available;

###################################
## System
###################################

echo '# Deleting system caches';

# Delete local snapshots
sudo tmutil deletelocalsnapshots /;

# Delete common caches
rm -rf ~/Library/Application\ Support/Caches/*;

###################################
## Logs
###################################

echo '# Deleting logs';

rm -rf ~/Library/Logs/Adobe*;
rm -rf ~/Library/Logs/CoreSimulator*;
rm -rf ~/Library/Logs/CreativeCloud*;
rm -rf ~/Library/Logs/NGLClient*;
rm -rf ~/Library/Logs/PDApp*;

###################################
## Delete cache
###################################

echo '# Deleting caches';

# Apple Books
rm -rf ~/Library/Containers/com.apple.iBooksX/Data/Library/Caches*

# Composer
rm -rf ~/.composer/*.phar
rm -rf ~/.composer/cache/

# Trello
rm -rf ~/Library/Containers/com.atlassian.trello/Data/Library/Application\ Support/Trello/Cache
rm -rf ~/Library/Containers/com.atlassian.trello/Data/Library/Application\ Support/Trello/Code\ Cache

# Homebrew
rm -rf ~/Library/Caches/Homebrew/*.phar;
rm -rf ~/Library/Caches/Homebrew/*.tar.gz;
rm -rf ~/Library/Caches/Homebrew/Cask/*;
rm -rf ~/Library/Caches/Homebrew/downloads/*;

# Dropbox
rm -rf ~/Dropbox/.dropbox.cache/old_files/*;

# Chrome
rm -rf ~/Library/Caches/Google/Chrome/*/Cache
rm -rf ~/Library/Application\ Support/Google/Chrome/*/Service\ Worker
rm -rf ~/Library/Caches/Google/Chrome/*/Code\ Cache

# Safari
rm -rf  ~/Library/Containers/com.apple.Safari/Data/Library/Caches/com.apple.Safari/*

# Spotify
rm -rf ~/Library/Caches/com.spotify.client/*

# Firefox
rm -rf ~/Library/Caches/Mozilla/updates/*
rm -rf ~/Library/Caches/Firefox/Profiles/*/cache2

# Transmit
rm -rf ~/Library/Caches/Transmit/

# Adobe
rm -rf ~/Library/Caches/Adobe/Typequest/*
rm -rf ~/Library/Caches/Adobe/CCX*

# Goofy
rm -rf ~/Library/Application\ Support/goofy-core/Code\ Cache/
rm -rf ~/Library/Application\ Support/goofy-core/Cache/

# Figma
rm -rf ~/Library/Application\ Support/Figma/DesktopProfile/v*/Cache;
rm -rf ~/Library/Application\ Support/Figma/DesktopProfile/v*/Code\ Cache;

# Zeplin
rm -rf ~/Library/Caches/io.zeplin.osx/;

# Reeder
rm -rf ~/Library/Containers/com.reederapp.macOS/Data/Library/Caches/*;
rm -rf ~/Library/Containers/com.reederapp.5.macOS/Data/Library/Caches/*;

# Xcode
rm -rf ~/Library/Developer/CoreSimulator/Caches/dyld/*
rm -rf ~/Library/Developer/Xcode/watchOS\ DeviceSupport/*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/13.6*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/14.0*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/14.1*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/14.2*
rm -rf ~/Library/Developer/Xcode/iOS\ DeviceSupport/14.3*
rm -rf ~/Library/Caches/com.apple.dt.Xcode/Downloads/Xcode*Watch*.dmg

# Todoist
rm -rf ~/Library/Containers/com.todoist.mac.Todoist/Data/Library/Caches/

# Trello
rm -rf ~/Library/Containers/com.atlassian.trello/Data/Library/Application\ Support/Trello/Service\ Worker/CacheStorage

# Discord
rm -rf ~/Library/Application\ Support/discord/Cache/*

# Sublime Text
rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Backup/*

# Slack
rm -rf ~/Library/Application\ Support/Slack/logs
rm -rf ~/Library/Application\ Support/Slack/Cache
rm -rf ~/Library/Application\ Support/Slack/IndexedDB
rm -rf ~/Library/Application\ Support/Slack/Code\ Cache
rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage

# Fluid
rm -rf ~/Library/Caches/com.fluidapp.FluidApp2.*

###################################
## Various
###################################

echo '# Empty trash';

# Trash
rm -rf ~/.Trash/*

###################################
## Debug
###################################

ineedspace_available;
