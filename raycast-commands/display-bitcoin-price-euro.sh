#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Bitcoin Price
# @raycast.mode inline
# @raycast.refreshTime 1h
# @raycast.packageName Dashboard

# Optional parameters:
# @raycast.author Tanguy Le Stradic
# @raycast.authorURL https://github.com/tanguyls
# @raycast.description Get current Bitcoin price from Coindesk.
# @raycast.icon images/bitcoin.png

price=$(curl -s http://api.coindesk.com/v1/bpi/currentprice.json | python3 -c "import json, sys; print(json.load(sys.stdin)['bpi']['EUR']['rate'])");
echo "${price%.*} € "
