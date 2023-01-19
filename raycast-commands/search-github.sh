#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Github
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/github.png
# @raycast.argument1 { "type": "text", "placeholder": "Product name", "percentEncoded": true }

open "https://github.com/search?type=code&q=$1"
