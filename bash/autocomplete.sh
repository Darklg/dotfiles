#!/bin/sh

###################################
## killall
###################################

complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal" killall;

###################################
## vagrant
###################################

complete -o "nospace" -W "box cloud destroy global-status halt help hostmanager init login package plugin port powershell provision push rdp reload resume snapshot ssh ssh-config status suspend up upload validate vbguest version winrm winrm-config" vagrant;

###################################
## git
###################################

complete -o "nospace" -W "add bisect branch checkout clone commit diff fetch grep init log merge mv pull push rebase reset rm show status submodule tag" git;
