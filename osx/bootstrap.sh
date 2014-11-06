#!/bin/bash

#####################
# Homebrew
#####################

# Install
command -v brew >/dev/null 2>&1 || { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; }

# Update
brew update;

# Modules
main_commands="git wget curl";
for i in $main_commands
do
    command -v "$i" >/dev/null 2>&1 || { brew install "${i}"; }
done;

# Cleanup
brew cleanup;

#####################
# Node
#####################

# Install
command -v node >/dev/null 2>&1 || { brew install node; }

# Update
npm update -g;

#####################
# Node modules
#####################

# Install grunt
command -v grunt >/dev/null 2>&1 || { npm install -g grunt-cli; }
