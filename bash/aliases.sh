
# Directory
alias ls='ls -Gh';
alias ll='ls -l';
alias la='ls -a';
alias lla='ls -al';
alias ..='cd ..';
alias ...='cd ../..';
alias hosts='sudo vim /etc/hosts';

# Files
alias clean='find . -iname ".DS_Store" -delete';

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
alias gitput='git stash && git pull && git push && git stash apply && git stash drop'
alias gl='git log --pretty=format:"%h %ad | %s%d [%an]" --max-count=20 --graph --date=short'
alias gs='git status -s && git fetch'

# Thanks to
# - http://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html