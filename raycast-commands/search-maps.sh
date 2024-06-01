#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Google Maps
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/google-maps.png
# @raycast.argument1 { "type": "text", "placeholder": "Place", "percentEncoded": true }

open "https://www.google.fr/maps?q=$1"
