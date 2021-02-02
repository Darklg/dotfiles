#!/bin/bash

MAINDIR="/Users/kevin/Websites/htdocs/localhost";
if [[ "${1}" == '' ]];then
    echo "Missing the dirname";
    return 0;
fi;
if [[ -d "${MAINDIR}/${1}/" ]];then
    echo "Dir already exists";
    return 0;
fi;
mkdir "${MAINDIR}/${1}/";
cd "${MAINDIR}/${1}/";
touch "${MAINDIR}/${1}/index.php";
subl "${MAINDIR}/${1}/";
open "http://localhost/${1}/index.php";
