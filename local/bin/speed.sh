#!/bin/bash

RXB=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
TXB=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
sleep 2 
RXBN=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
TXBN=$(cat /sys/class/net/wlan0/statistics/tx_bytes)
RXDIF=$(echo $((RXBN - RXB)) )
TXDIF=$(echo $((TXBN - TXB)) )
RXT=$(ifstat wlan0 | grep -i "RX Bytes:" | awk '{print $2}' | cut -d: -f2)
TXT=$(ifstat wlan0 | grep -i "RX Bytes:" | awk '{print $6}' | cut -d: -f2)

echo -e "^[f0;DOWN ^[f2;$((RXDIF / 1024 / 2))K/s  ^[f0;UP ^[f4;$((TXDIF / 1024 / 2))K/s^[f0;"
#echo -e "\b\x08$((RXDIF / 1024 / 2))K/s \x02$((TXDIF / 1024 / 2))K/s\x01"
