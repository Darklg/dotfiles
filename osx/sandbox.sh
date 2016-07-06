#!/bin/bash

MAINDIR="/Users/kevin/Websites/htdocs/localhost";
mkdir "${MAINDIR}/${1}/";
cd "${MAINDIR}/${1}/";
touch "${MAINDIR}/${1}/index.html";
subl "${MAINDIR}/${1}/";
open "http://localhost/${1}/index.html";
