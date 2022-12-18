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

if [[ -f "${_config_file}" ]];then
   . "${_config_file}";
else
   echo "Missing raycast-config file;";
   return;
fi;

curl -s https://api.todoist.com/sync/v9/sync \
    -H "Authorization: Bearer ${_todoist_token}" \
    -d commands="[{\"type\": \"item_add\", \"due\":{\"string\":\"tomorrow\"},\"uuid\": \"${_UUID_TMP}\",\"temp_id\": \"${_TEMP_ID}\", \"args\": {\"content\": \"${1}\",\"labels\": ${_todoist_labels}}}]" > /dev/null;

echo "Task created !";
