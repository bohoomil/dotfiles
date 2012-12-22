#!/bin/sh
# Status bar script for dwm

# Credits and Thank Yous:
# #######################

# CPU line:
# Procyon (https://bbs.archlinux.org/viewtopic.php?pid=661592)
#
# Status bar options:
# http://0mark.unserver.de/projects/dwm-sprinkles/tfm
#
# Battery, monitor brightness cripts & lots of details:
# Jason Ryan (http://jasonwryan.com/)
#
# A few kind guys whose names I cannot recall,
# but whose work came of great help.

vpn(){
	con="$(host google.com>/dev/null && echo -e ON || echo -e NO)"
	loc="$("$HOME/.local/bin/loc.sh")"
	if [ $con == ON ] && [ $loc == PL ]; then
		#red 9
		echo -e "^[f18;GEO ^[f3;NO^[f18;"
	elif [ $con == NO ]; then
		echo -e "^[f18;GEO ^[f7;--^[f18;"
	else
		#blue 12
		echo -e "^[f18;GEO ^[f9;$loc^[f18;"
	fi
}

cpu(){
	proc="$(eval $(awk '/^cpu /{print "previdle=" $5 "; prevtotal=" $2+$3+$4+$5 }' /proc/stat); sleep 0.4; 
	eval $(awk '/^cpu /{print "idle=" $5 "; total=" $2+$3+$4+$5 }' /proc/stat); 
	INTERVALTOTAL=$((total-${prevtotal:-0})); 
	echo "$((100*( (INTERVALTOTAL) - ($idle-${previdle:-0}) ) / (INTERVALTOTAL) ))")"
	if [ "$proc" -ge 0 ] && [ "$proc" -le 9 ]; then
		#green 10
		echo -e "^[f18;CPU ^[f5;$proc%^[f18;"
	elif [ "$proc" -ge 10 ] && [ "$proc" -le 24 ]; then
		#cyan 14
		echo -e "^[f18;CPU ^[f13;$proc%^[f18;"
	elif [ "$proc" -ge 25 ] && [ "$proc" -le 49 ]; then
		#yellow 11
		echo -e "^[f18;CPU ^[f7;$proc%^[f18;"
	elif [ "$proc" -ge 50 ] && [ "$proc" -le 74 ]; then
		#magenta 13
		echo -e "^[f18;CPU ^[f11;$proc%^[f18;"
	else
		#red 9
		echo -e "^[f18;CPU ^[f3;$proc%^[f18;"
	fi
}

#mem(){
#	ram="$(free -m |awk '/cache:/ { print $3"M" }')"
#	#yellow 13
#	echo -e "^[f18;MEM ^[f6;$ram^[f18;"
#}

hdd(){
	#hdd1="$(df /dev/sda7 | awk '/^\/dev/{printf "%s ", $5}' | sed '$s/.$//')"
	hdd1="$(df -t rootfs | awk '/^rootfs/{printf $5"\n"}')"
	hdd2="$(df /dev/sda3 | awk '/^\/dev/{printf $5"\n"}')"
	hddt="$(curl --connect-timeout 1 -fsm 3 telnet://127.0.0.1:7634 | awk -F '|' '{ print $4 }')"
		#cyan 6 / magenta 13
		echo -e "^[f18;SDA1^[f12; $hdd1  ^[f18;SDA3^[f12; $hdd2  ^[f18;TMP ^[f11;$hddt°C^[f18;"
}

#elm(){
	#maildirs="/mnt/sda3/data/mail/*/INBOX/new/"
	#mls="$(find $maildirs -type f | wc -l)"
	#if [ $mls == 0 ]; then
		##black 0
		#echo -e "^[f18;ELM ^[f1;0^[f18;"
	#else
		##red 2
		#echo -e "^[f18;ELM ^[f3;$mls^[f18;"
	#fi
#}

eml(){
	boh="$(gmail3-boh.py)"
	night="$(gmail3-night.py)"
	ac="$(gmail3-ac.py)"
	echo -e "^[f18;ELM ^[f1; $boh $night $ac^[f18;"
}

dte(){
	dat="$(date "+%a %d.%m, %H:%M")"
	# violet bright
	echo -e "^[f19;$dat^[f18;"
}

vol(){
	#level="$(amixer get PCM | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
	level="$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')"
	mix=`amixer get Master | tail -1`;
	if [[ $mix == *\[off\]* ]]
	then
		# red 9
		echo -e "^[f18;VOL ^[f3;OFF^[f18;"
	elif [[ $mix == *\[on\]* ]]
	then
		# green 2
		echo -e "^[f18;VOL ^[f4;$level^[f18;"
	else
		# red 9
		echo -e "^[f18;VOL ^[f2;---^[f18;"
	fi
}

bat(){
	batst="$(battstat)"
	batt='/sys/class/power_supply/BAT0/'
	state=$(<"${batt}"/status)
	if [ $state = 'Discharging' ] || [ $state = 'Charging' ]; then
		echo -e "^[f18;BAT $batst"
	fi
}

mon(){
	brt="$(brightness)"
	# cyan 6
	echo -e "^[f18;MON ^[f12;$brt^[f18;"
}

# Pipe to status bar
xsetroot -name "$(bat)  $(vol)  $(cpu)  $(hdd)  $(vpn) ^[d1; $(dte)"
