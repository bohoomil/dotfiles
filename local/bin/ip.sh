#!/bin/bash
red='\e[0;31m'
NC='\e[0m'

echo -e "${red}Internal: ${NC}"
ifconfig | grep 'inet addr'
echo -e "${red}External: ${NC}"
echo -ne "\t  "
curl http://www.floft.net/apps/ip?text 2>/dev/null
echo
