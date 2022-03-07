#!/bin/bash

###################################
## Questions
###################################

read -p "What is the plugin path ? (ex:vanilla-plugin) : " _plugin_path;
read -p "What is the plugin classname ? (ex:vanillaPlugin) : " _plugin_classname;
read -p "What is the plugin name ? (ex:vanilla Plugin) : " _plugin_name;
read -p "Path : '${_plugin_path}' / Classname : '${_plugin_classname}'  / Name : '${_plugin_name}' / ok for you ?" _ok_for_you;

###################################
## Folders
###################################

mkdir "${_plugin_path}";
mkdir "${_plugin_path}/assets";
mkdir "${_plugin_path}/assets/js";
mkdir "${_plugin_path}/assets/css";
mkdir "${_plugin_path}/assets/images";
cd "${_plugin_path}";

###################################
## Index
###################################

_index_content=$(cat <<EOF
<!DOCTYPE HTML>
<html lang="en-EN">
    <head>
        <meta charset="UTF-8" />
        <title>${_plugin_name}</title>
        <meta name="viewport" content="width=device-width" />
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        <script src="assets/js/${_plugin_path}.js"></script>
    </head>
    <body>
        <h1>${_plugin_name}</h1>
        <div id="demo-block"></div>
        <script>new ${_plugin_classname}(document.getElementById('demo-block'));</script>
    </body>
</html>
EOF
);
echo "${_index_content}" > 'index.html';

###################################
## CSS
###################################

_css_content=$(cat <<EOF
@charset "UTF-8";

/* ----------------------------------------------------------
  Base
---------------------------------------------------------- */

html,
body {
    min-height: 80vh;
}

* {
    font-family: sans-serif;
}

html {
    background-color: #F0F0F0;
}

body {
    margin: 1em auto;
    padding: 1em;
    max-width: 600px;
    background-color: #fff;
}
EOF
);
echo "${_css_content}" > 'assets/css/style.css';

###################################
## Script
###################################

_script_content=$(cat <<EOF
/*
 * Plugin Name: ${_plugin_name}
 * Version: 0.1.0
 * Plugin URL: https://github.com/Darklg/JavaScriptUtilities
 * JavaScriptUtilities ${_plugin_name} may be freely distributed under the MIT license.
 */

function ${_plugin_classname}(\$item, settings) {
    'use strict';
    /* User settings */
    settings = settings || {};
    settings.offset = settings.offset || 1;
}
EOF
);
echo "${_script_content}" > "assets/js/${_plugin_path}.js";
