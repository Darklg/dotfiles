#!/bin/bash

   osascript <<EOF
tell application "Finder"
   close every window
end tell

tell application "System Events"
    set theVisibleApps to (name of application processes where visible is true)
end tell

repeat with thisApp in theVisibleApps
    try
        tell application thisApp
            try
                close every document without saving
            on error
                close every window
            end try
        end tell
    end try
end repeat

EOF
