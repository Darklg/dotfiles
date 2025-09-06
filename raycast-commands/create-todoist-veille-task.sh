#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title TaskToDo
# @raycast.mode compact
# @raycast.packageName Internet

# Optional parameters:
# @raycast.icon images/todoist.png
# @raycast.argument1 { "type": "text", "placeholder": "Task" }

# Documentation:
# @raycast.description Create a task in Todoist with specific tags

_TEMP_ID=$(uuidgen);
_UUID_TMP=$(uuidgen);
_config_file="$(dirname $BASH_SOURCE)/raycast-config.sh";

if ! command -v op &> /dev/null; then
  echo "op is not installed. Please install op to access 1Password."
  return 0;
fi

# Get the Todoist private token from 1Password
eval $(op signin);
_todoist_token=$(op item get "Todoist" --field "TOKEN");
_todoist_labels="[\"veille-actionnable\",\"nobrains\",\"commitdujour\"]";

curl -s https://api.todoist.com/sync/v9/sync \
    -H "Authorization: Bearer ${_todoist_token}" \
    -d commands="[{\"type\": \"item_add\", \"due\":{\"string\":\"tomorrow\"},\"uuid\": \"${_UUID_TMP}\",\"temp_id\": \"${_TEMP_ID}\", \"args\": {\"content\": \"${1}\",\"labels\": ${_todoist_labels}}}]" > /dev/null;

echo "Task created !";
