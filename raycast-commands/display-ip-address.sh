#!/bin/bash

# @raycast.title IP Address
# @raycast.author Kevin
# @raycast.authorURL https://github.com/Darklg
# @raycast.description Get IP Address from [ifconfig.me](https://ifconfig.me/).

# @raycast.icon 💾
# @raycast.mode inline
# @raycast.packageName Dashboard
# @raycast.schemaVersion 1

# @raycast.refreshTime 1h

echo $(curl -s ifconfig.me);


