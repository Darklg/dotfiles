#!/bin/bash

###################################
## Git
###################################

git config --global pull.rebase true;

###################################
## RTK
###################################

rtk init -g

###################################
## Computer name
###################################

sudo scutil --set ComputerName "MacBook-Kevin"
sudo scutil --set LocalHostName "MacBook-Kevin"
sudo scutil --set HostName "MacBook-Kevin"
