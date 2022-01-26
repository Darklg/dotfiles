#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Convert a timestamp to time
# @raycast.mode compact
# @raycast.packageName Web Searches

# Optional parameters:
# @raycast.icon images/wikipedia.png
# @raycast.argument1 { "type": "text", "placeholder": "timestamp", "percentEncoded": true }

echo $(date -r $1);
