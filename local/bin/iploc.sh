#!/bin/sh
#
# by bohoomil
# display your IP and geolocation
# (e.g. test if your vpn is working)
# dependency: GeoIP

myip=$(dig myip.opendns.com @resolver1.opendns.com +short)
loc=$(geoiplookup $myip | awk -F' ' '{gsub(/,/,""); print $4}')

echo -en "IP: $myip\n";
echo -en "country:\e[01;35m $loc\n";

exit 0
