#!/bin/bash

add_to_dock() {
    defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$1</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
}

# Clear Dock
defaults write com.apple.dock persistent-apps -array ''

# Add apps
add_to_dock "/Applications/Safari.app"
add_to_dock "/Applications/Google Chrome.app"
add_to_dock "/System/Applications/Mail.app"
add_to_dock "/Applications/Sublime Text.app"
add_to_dock "/Applications/Spotify.app"
add_to_dock "/Applications/Todoist.app"
add_to_dock "/Applications/Trello.app"
add_to_dock "/Applications/TogglDesktop.app"
add_to_dock "/Applications/Slack.app"
add_to_dock "/Applications/Sequel Pro.app"
add_to_dock "/System/Applications/Utilities/Terminal.app"
add_to_dock "/Applications/Tower.app"
add_to_dock "/Applications/Transmit.app"
add_to_dock "/Applications/1Password 7.app"
add_to_dock "/Applications/Sketch.app"
add_to_dock "/Applications/Goofy.app"
add_to_dock "/System/Applications/Messages.app"
add_to_dock "/Applications/Tweetbot.app"
add_to_dock "/System/Applications/Calendar.app"
add_to_dock "/System/Applications/Notes.app"
add_to_dock "/Applications/Xcode.app"
add_to_dock "/Applications/Boop.app"
add_to_dock "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Create a stack with recently opened apps
defaults write com.apple.dock persistent-others -array-add '{ "tile-data" = { "list-type" = 1; }; "tile-type" = "recents-tile"; }'

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Restart dock
killall Dock;
