# vim:ft=sh:
#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

if [ -d /etc/profile.d/ ]; then
  for profile in /etc/profile.d/*.sh; do
    [ -r "$profile" ] && . "$profile"
  done
  unset profile
fi

if [ -d $HOME/.config/autostart ]; then
  for c in $HOME/.config/autostart/* ; do
    [ -x "$c" ] && . "$c"
  done
  unset c
fi

exec $HOME/.local/bin/dwm-start 2>/dev/null
#VirtualBox -startvm "<virtual-machine>" -fullscreen

