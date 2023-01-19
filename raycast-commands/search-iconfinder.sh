#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Iconfinder
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/iconfinder.png
# @raycast.argument1 { "type": "text", "placeholder": "Icon name...", "percentEncoded": true }

open "https://www.iconfinder.com/search?price=free&q=$1"
