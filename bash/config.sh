#!/bin/sh

#-------------------------
# Conf

export PS1='\[\033[01;32m\]\u@\h\[\033[01;36m\] \t \w\n\$ \[\033[00m\]';
export COPYFILE_DISABLE=true;

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups;

# Cask
export HOMEBREW_CASK_OPTS=--appdir=/Applications;

# Path
export PATH=/usr/local/bin:$PATH

#-------------------------
# Actions when terminal opens

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Display uptime
uptime;

# Hide bash depreciation warning
export BASH_SILENCE_DEPRECATION_WARNING=1;
