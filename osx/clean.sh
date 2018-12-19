#!/bin/bash

# Clean RAM & stuff
echo '# Purge';
sudo purge;

# Vacuum mail
echo '# Mails';
sudo sqlite3 ~/Library/Mail/V6/MailData/Envelope\ Index vacuum;

# Run OSX Scripts
echo '# Scripts';
ls -al /var/log/*.out;
sudo periodic daily weekly monthly;

# Rebuild 'open with'
echo '# Open with';
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user;

# Restart some apps
echo '# Restart apps';
killall Dock Finder;

