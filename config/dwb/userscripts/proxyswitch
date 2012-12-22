#!/bin/bash

# Copyright 2012 Florian Bruhin <me@the-compiler.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>. 

declare -A urls

urls['ziproxy']="localhost:9001"
urls['polipo']="localhost:3129"
urls['ssh']='localhost:8123'
# ...

dwb_command() {
	if [[ "$DWB_FIFO" ]]; then # running inside DWB
		echo "$@" | sed 's/ *;; */\n/' >> "$DWB_FIFO"
	else
		if ! pgrep dwb >/dev/null; then
			error "dwb isn't running!"
		fi
		dwb -x "$@"
	fi
}

error() {
	if [[ "$DWB_FIFO" ]]; then # running inside DWB
		echo "js window.alert('$@');" >> "$DWB_FIFO"
	else
		echo "$@"
	fi
	exit 1
}

set_proxy() {
	proxy="${urls[$1]}"
	if [[ -z "$proxy" ]]; then
		error "Proxy $1 is unknown!"
	fi
	dwb_command "local_set proxy true ;; local_set proxy-url $proxy"
}

unset_proxy() {
	dwb_command "local_set proxy false ;; local_set proxy-url NULL"
}

if [[ "$DWB_FIFO" ]]; then
	# fills $1 with the argument in dwb's command line.
	set -- "$DWB_ARGUMENT" # quotes sic!
fi

if (( $# != 1 )); then
	error "Usage: $0 <proxyname>"
fi

case $1 in
	"off") unset_proxy ;;
	*) set_proxy "$1" ;;
esac
