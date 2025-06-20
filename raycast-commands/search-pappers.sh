#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Pappers FR
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/pappers.png
# @raycast.argument1 { "type": "text", "placeholder": "Company name", "percentEncoded": true }

open "https://www.pappers.fr/recherche?q=$1"
