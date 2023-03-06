#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title What does it means
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/google-translate.png
# @raycast.argument1 { "type": "text", "placeholder": "Translate to french", "percentEncoded": true }

open "https://translate.google.com/?hl=fr&sl=auto&tl=fr&text=$1&op=translate"
