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
alias ....='cd ../../..';
alias hosts='sudo vim /etc/hosts';

# PHP
alias php='/Applications/MAMP/bin/php/php5.6.10/bin/php';
alias composer='/Applications/MAMP/bin/php/php5.6.10/bin/php /Users/kevin/Websites/htdocs/composer.phar';
alias phpunit='/Applications/MAMP/bin/php/php5.6.10/bin/php /usr/local/bin/phpunit';

# Alias MySQL
alias mysql='/Applications/MAMP/Library/bin/mysql'
alias mysqladmin='sudo /Applications/MAMP/Library/bin/mysqladmin'
alias mysqlstop='sudo /Applications/MAMP/Library/bin/mysqladmin -u root -p shutdown'
alias mysqlstart='sudo /Applications/MAMP/Library/bin/mysqld_safe'

# Alias Apache
alias apachereboot='sudo /Applications/MAMP/Library/bin/httpd -k restart';

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
alias gitisub='git pull --recurse-submodules && git submodule update --recursive';
alias gitexp='git archive --format zip --output ../export.zip master && echo "Export ok !"';

# Thanks to
# - http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
