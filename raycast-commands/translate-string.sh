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

_DATA1='{"content": "';
_DATA2='","label_ids":';
_DATA3=',"due_string":"today"}';

_config_file="$(dirname $BASH_SOURCE)/raycast-config.sh";
if [[ -f "${_config_file}" ]];then
   . "${_config_file}";
else
   echo "Missing raycast-config file;";
   return;
fi;

curl -s "https://api.todoist.com/rest/v1/tasks" -X POST --data "${_DATA1}${1}${_DATA2}${_todoist_labels}${_DATA3}" -H "Content-Type: application/json" -H "Authorization: Bearer ${_todoist_token}" > /dev/null;

echo "Task created !";
