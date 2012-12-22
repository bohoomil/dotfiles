#!/bin/sh
#
# by bohoomil
# display your IP and geolocation
# (may prove your vpn is working)
# prerequisite: GeoIP

myip=$(dig myip.opendns.com @resolver1.opendns.com +short)
loc=$(geoiplookup $myip | awk -F' ' '{print $4}' | sed '$s/,$//')

echo -en "IP: $myip\n"; 
echo -en "country:\e[01;35m $loc\n";

exit 0
