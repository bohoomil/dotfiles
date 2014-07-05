#!/bin/sh

sudo hddtemp /dev/sda | awk '{ print $3 }'
