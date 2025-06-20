#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search SEO
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/google.png
# @raycast.argument1 { "type": "text", "placeholder": "Search term...", "percentEncoded": true }

open -a "Google Chrome" --args --incognito "https://www.google.com/search?q=${1}"
