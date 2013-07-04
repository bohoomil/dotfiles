#!/bin/sh
# returns external IP's country code 

myip=$(dig myip.opendns.com @resolver1.opendns.com +short)
loc=$(geoiplookup $myip | awk -F' ' '{print $4}' | sed '$s/,$//')

echo -ne "$loc"

exit 0
