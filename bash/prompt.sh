#!/bin/sh

#-------------------------
# Prompt line | Modified by @corndogcomputer
# https://github.com/emilis/emilis-config/blob/master/.bash_ps1

# Fill with minuses
# (this is recalculated every time the prompt is shown in function prompt_command):
fill="___ "
reset_style='\[\033[00m\]'
status_style='\[\033[0;90m\]'
prompt_style='\[\033[00m\]'
command_style='\[\033[00m\]'


# http://frontendmayhem.com/pimp-my-terminal/
# https://unix.stackexchange.com/a/155077
parse_git_branch() {
    inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"
    if [ "${inside_git_repo}" ]; then
        GIT_MESSAGE_TMP=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/');
        output=$(git status --untracked-files=no --porcelain);
        if [ -z "$output" ]; then
            GIT_MESSAGE_TMP=$GIT_MESSAGE_TMP;
        else
            GIT_MESSAGE_TMP=$GIT_MESSAGE_TMP" \033[0;33m[!]\033[00m";
        fi;
        printf "${GIT_MESSAGE_TMP}";
    fi;
}

# Prompt variable:
PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\h: \[\e[m\]\[\e[0;31m\]\w\[\e[m\]'"$command_style\$(parse_git_branch) \n$ "

# Reset color for command output
# (this one is invoked every time before a command is executed):
trap 'echo -ne "\033[00m"' DEBUG

function prompt_command {
# create a $fill of all screen width minus the time string and a space:
let fillsize=${COLUMNS}-9
fill=""
while [ "$fillsize" -gt "0" ]
do
fill="-${fill}" # fill with underscores to work on
let fillsize=${fillsize}-1
done

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
bname=`basename "${PWD/$HOME/~}"`
echo -ne "\033]0;${bname}: ${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"
;;
*)
;;
esac
}

PROMPT_COMMAND=prompt_command

