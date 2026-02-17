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


# Replace straight quotes with typographic quotes in the input
_task_content=$(echo "${1}" | sed "s/\"/“/g; s/'/‘/g")
open "todoist://openquickadd?content=${_task_content} @veille-actionnable @nobrains @commitdujour";
echo "Task created !";
echo "${1}" >> ~/raycast-send-todoist-history.txt;
