#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Icon Search in SVG Repo
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/iconfinder.png
# @raycast.argument1 { "type": "text", "placeholder": "Icon name...", "percentEncoded": true }

open "https://www.svgrepo.com/vectors/$1/monocolor/"
