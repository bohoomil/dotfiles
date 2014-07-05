#!/bin/bash

# Usage:
# chk_ports.sh <port-number>

exec 6<>/dev/tcp/127.0.0.1/$1 && echo "$1 is open." || echo "$1 is closed."
exec 6>&- # close output connection
exec 6<&- # close input connection

