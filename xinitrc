#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for rcd in /etc/X11/xinit/xinitrc.d/* ; do
    [ -x "$rcd" ] && . "$rcd"
  done
  unset rcd
fi

if [ -d /etc/profile.d/ ]; then
  for profile in /etc/profile.d/*.sh; do
    [ -r "$profile" ] && . "$profile"
  done
  unset profile
fi

dwm(){
if [ -d $HOME/.config/autostart_wm ]; then
  for auto in $HOME/.config/autostart_wm/* ; do
    [ -x "$auto" ] && . "$auto"
  done
  unset auto
fi

#exec adwm
exec $HOME/.local/bin/dwm-start 2>/dev/null
}

vbox(){
  VirtualBox -startvm "<virtual-machine>" -fullscreen
}

dwm
#vbox

# vim:ft=sh:
