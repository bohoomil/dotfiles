#!/bin/sh

C04="\x04" # mid grey on black
C09="\x09" # red9
C11="\x0B" # green10
C12="\x0C" # yellow3

batt=/sys/class/power_supply/BAT0/

current=$(<"${batt}"/charge_now)
full=$(<"${batt}"/charge_full)
state=$(<"${batt}"/status)

charge=$(( $current * 100 / $full )) 

case "${state}" in
          Full) batstat="${C11}[=]${C04}" ;;
      Charging) batstat="${C11}[+]${C04}" ;;
   Discharging) batstat="${C09}[-]${C04}" ;;
esac

printf '%s\n' "${batstat} ${C12}${charge}%${C04}"
