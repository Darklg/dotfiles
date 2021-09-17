#!/bin/bash

_SOURCEDIR="$( dirname "${BASH_SOURCE[0]}" )/";

. "${_SOURCEDIR}/bootstrap/brew.sh";
xcode-select --install;
. "${_SOURCEDIR}/bootstrap/node.sh";
. "${_SOURCEDIR}/bootstrap/phar.sh";
. "${_SOURCEDIR}/bootstrap/mas.sh";
