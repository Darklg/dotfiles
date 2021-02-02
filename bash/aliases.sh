#!/bin/sh

DOTFILES_ALIAS_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

function chromereload(){
    echo "- Reloading Current Chrome Tab";
    osascript "${DOTFILES_ALIAS_DIR}/chrome-reload-url.applescript";
    echo "- Tab is reloaded";
}

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
alias .....='cd ../../../..';
alias hosts='sudo vim /etc/hosts';

# Alias MySQL
#alias mysql='/Applications/MAMP/Library/bin/mysql'
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
alias settime='sudo ntpdate -u time.apple.com';

# reboot / halt / poweroff
alias reboot='sudo /sbin/reboot';
alias poweroff='sudo /sbin/poweroff';
alias halt='sudo /sbin/halt';
alias shutdown='sudo /sbin/shutdown';
alias suspend='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias faisdodo="osascript -e 'tell application \"System Events\" to sleep'";
alias screenshotnow="screencapture -x ~/Dropbox/screenshot-current-1.jpg ~/Dropbox/screenshot-current-2.jpg ~/Dropbox/screenshot-current-3.jpg";
alias stopscreen="pmset displaysleepnow";

# Alias Git
alias ga='git add -u . && git add .'
alias gfoire='git reset --hard HEAD && git submodule update --init --recursive'
alias gitput='git stash && git pull && git push --all && git stash apply && git stash drop'
alias gl='git log --pretty=format:"%Cred• %h%Creset%C(yellow)%d%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%n%s" --max-count=15 --reverse --date=short'
alias gs='git status -s && git fetch'
alias gitrmws='git add -u . && git add . && git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero | git stash save --keep-index --include-untracked'
alias ghpages='git checkout gh-pages && git rebase master && git checkout master';
alias giti='git gc && git pull --rebase && git push --all';
alias gitisub='git pull --recurse-submodules && git submodule update --recursive';
alias gitexp='git archive --format zip --output ../export.zip master && echo "Export ok !"';
function gitrmsubmodule () {
    if [[ "${1: -1}" == '/' ]];then
        echo "- Submodule path should not end with a '/'.";
        return 0;
    fi;
    if [[ -z "${1}" ]]; then
        echo "- Missing argument ! You should specify a submodule folder.";
        return 0;
    fi;
    if [[ ! -d "${1}" ]]; then
        echo "- The module ${1} does not exists";
        return 0;
    fi;
    git config -f .gitmodules --remove-section submodule.${1};
    git config -f .git/config --remove-section submodule.${1};
    git add .gitmodules;
    git rm --cached ${1};
    rm -rf .git/modules/${1};
    git commit -m "Git - Remove submodule ${1}";
}

# Thanks to
# - http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html
