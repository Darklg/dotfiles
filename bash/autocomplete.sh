#!/bin/sh

###################################
## killall
###################################

complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal" killall;

###################################
## git
###################################

complete -o "nospace" -W "add bisect branch checkout clone commit diff fetch grep init log merge mv pull push rebase reset rm show status submodule tag" git;

###################################
## SSH
###################################

_ssh_hosts_completion() {
    if [[ "${DKLG_SSH_CONFIG_FILE}" == "" ]];then
        return 0;
    fi;

    COMPREPLY=()
    local cur prev
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [ "$prev" = "ssh" ]; then
        local hosts
        hosts=$(grep -E '^[ \t]*Host +[^*]' ${DKLG_SSH_CONFIG_FILE}  2>/dev/null | sed -e 's/^[ \t]*Host[ \t]*//')
        COMPREPLY=( $(compgen -W "${hosts}" -- "${cur}") )
    fi
    return 0
}

complete -F _ssh_hosts_completion ssh
