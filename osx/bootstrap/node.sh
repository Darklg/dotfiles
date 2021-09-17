#!/bin/bash

###################################
## Node
###################################

# Install
command -v node >/dev/null 2>&1 || { brew install node; }

# Update
npm update -g --quiet;

# Settings
npm config set cache-min 9999999;

#####################
# Node modules
#####################

# Speedline
npm install -g speedline;

# Gulp
npm install -g gulp-cli;
