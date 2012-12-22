#!/bin/bash
# dwb: Control m

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

# %u  ..  Media stream URL
# %t  ..  Media title
# %e  ..  Media file suffix (extension)
# %h  ..  Media thumbnail URL
exec="mplayer %u"

[[ -z "$DWB_FIFO" ]] && no_dwb=1
which -q zenity || no_zenity=1
which -q quvi || no_quvi=1

if [[ "$no_dwb" && ("$no_zenity" || "$no_quvi") ]]; then
    echo -n "Error: You don't run this script from dwb (or have an old dwb-"
    echo "version) and you don't have Zenity or quvi installed!"
    exit 1
elif [[ "$no_zenity" ]]; then
    echo "js window.alert('You need to have Zenity installed to run this script!');" >> "$DWB_FIFO"
    exit 1
elif [[ "$no_dwb" ]]; then
    zenity --error --text "You don't run this script from dwb (or have an old dwb-version)!"
    exit 1
elif [[ "$no_quvi" ]]; then
    echo "js window.alert('You need to have quvi installed to run this script!');" >> "$DWB_FIFO"
    exit 1
fi

formats=$(quvi -v quiet -F "$DWB_URI" 2>&1)

if [[ "$formats" == "error: no support"* ]]; then
    echo "js window.alert('Quvi does not support this page!');" >> "$DWB_FIFO"
    exit 1
fi

IFS='|' read -a format_array <<< "${formats%% : *}"

if [[ ${#format_array[@]} == 0 ]]; then
    format="default"
elif [[ ${#format_array[@]} == 1 ]]; then
    format="${format_array[0]}"
else
    format=$(zenity --text "Which format do you want?" --list --column=format default best "${format_array[@]}")
fi

quvi -f "$format" --exec "$exec" -v mute "$DWB_URI"
status=$?
if [[ "$status" != 0 ]]; then
    echo "js window.alert('quvi exited with nonzero status $status!');" >> "$DWB_FIFO"
fi
