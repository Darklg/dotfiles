#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Search in Amazon FR
# @raycast.mode silent
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/amazon.png
# @raycast.argument1 { "type": "text", "placeholder": "Product name", "percentEncoded": true }

open "https://www.amazon.fr/s?k=$1"
