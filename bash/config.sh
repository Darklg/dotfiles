#!/bin/sh
#!/bin/sh

#-------------------------
# Conf

export PS1='\[\033[01;32m\]\u@\h\[\033[01;36m\] \t \w\n\$ \[\033[00m\]';
export COPYFILE_DISABLE=true;

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups;

# Cask
export HOMEBREW_CASK_OPTS=--appdir=/Applications;

#-------------------------
# Actions when terminal opens

# Display uptime
uptime;
