#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Can I Use
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/caniuse.png
# @raycast.argument1 { "type": "text", "placeholder": "Property ...", "percentEncoded": true }

open "https://caniuse.com/?search=$1"
