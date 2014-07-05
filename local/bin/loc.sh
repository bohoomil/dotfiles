#!/bin/sh
# returns external IP's country code and saves it to a file

con=$(wget -q --tries=10 --timeout=20 -O - http://google.com >/dev/null && echo -e ON || echo -e NO)
myip=$(dig myip.opendns.com @resolver1.opendns.com +short)
loc=$(geoiplookup $myip | awk -F' ' '{print $4}' | sed '$s/,$//')

if [[ $con == "ON" ]]; then
  echo "$loc" > "$HOME/tmp/loc"
else
  echo "NO"
fi

exit 0
