#!/bin/bash

# Set the file name for the changelog
CHANGELOG="CHANGELOG.md"

# Set the number of commits to include in the changelog
NUM_COMMITS=20

# Write header to the CHANGELOG.md file
echo "# Changelog" > "$CHANGELOG"
echo "" >> "$CHANGELOG";

# Generate the changelog entries
git log -n $NUM_COMMITS --pretty=format:"## [%D] - %cs%n%b" | sed 's/tag: //' >> "$CHANGELOG"

# Output the location and contents of the changelog
echo "Changelog generated at $CHANGELOG:"
cat "$CHANGELOG"
