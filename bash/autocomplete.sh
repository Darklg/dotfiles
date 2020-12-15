#!/bin/sh

###################################
## killall
###################################

complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal" killall;

###################################
## git
###################################

complete -o "nospace" -W "add bisect branch checkout clone commit diff fetch grep init log merge mv pull push rebase reset rm show status submodule tag" git;
