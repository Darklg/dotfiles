#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Wikipedia FR
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/wikipedia.png
# @raycast.argument1 { "type": "text", "placeholder": "Search term...", "percentEncoded": true }

open "https://fr.wikipedia.org/w/index.php?search=$1"
