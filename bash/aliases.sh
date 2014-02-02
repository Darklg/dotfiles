#!/bin/sh

# Functions
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Directory
alias ls='ls -Gh';
alias ll='ls -l';
alias la='ls -a';
alias lla='ls -al';
alias ..='cd ..';
alias ...='cd ../..';
alias hosts='sudo vim /etc/hosts';

# Utilities
# Quick Webserver
alias serv='open http://0.0.0.0:1234 && python -m SimpleHTTPServer 1234';

# Files
alias clean='find . -iname ".DS_Store" -delete && dot_clean .';

# Paste clipboard in new vim window | apple.stackexchange.com/a/1533
alias pavi='pbpaste | vim -';

# Alias Services Web
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'

# Dates
alias now='date +"%T';
alias nowdate='date +"%d-%m-%Y"';

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot';
alias poweroff='sudo /sbin/poweroff';
alias halt='sudo /sbin/halt';
alias shutdown='sudo /sbin/shutdown';
alias suspend='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Alias Git
alias ga='git add -u . && git add .'
alias gfoire='git reset --hard HEAD'
alias gitput='git stash && git pull && git push --all && git stash apply && git stash drop'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --max-count=20 --graph --date=short'
alias gs='git status -s && git fetch'
alias ghpages='git checkout gh-pages && git rebase master && git checkout master';
alias giti='git gc && git pull --rebase && git push --all';

# Thanks to
# - http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
