# source .bashrc {{{
if [ -r ~/.bashrc ]; then
  . ~/.bashrc;
fi
#}}}

# environmental defaults {{{
export EDITOR="vim"
export FCEDIT="vim"
export VISUAL="vim"
export CHROOT='/mnt/sda2/ArchBuilds'
export BROWSER='firefox'
export QT_XFT="true"
export GDK_USE_XFT="1"
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd_hrgb'
export TIME_STYLE="long-iso"
export GTK2_RC_FILES='/usr/local/share/gtk-2.0/gtkrc'
export LESS="-i -n -c -z-6 -g -M -R"
export LESSCHARSET='utf-8'
export LESSOPEN="|$HOME/.local/bin/lesspipe.sh %s 2>&-"
export LESSCOLORIZER="pygmentize"
export PYGMENTS_STYLE="euphrasia"
export PYGMENTS_BG="dark"
export PAGER="less"
export VIEWER=$PAGER
export SYSTEMD_PAGER=$PAGER
#export SAL_USE_VCLPLUGIN="gtk lowriter"
#export GSETTINGS_BACKEND=dconf
#export http_proxy="localhost:8118"

alias wine='schroot -pqd "$(pwd)" -- wine'
#}}}

# gpg & ssh {{{
/usr/bin/keychain -Q -q --nogui id_rsa

[ -z "$HOSTNAME" ] && HOSTNAME=$(uname -n)
[ -f $HOME/.keychain/${HOSTNAME}-sh ] && source $HOME/.keychain/${HOSTNAME}-sh
[ -f $HOME/.keychain/${HOSTNAME}-sh-gpg ] && source $HOME/.keychain/${HOSTNAME}-sh-gpg

[ $? == 0 ] && clear

#GPG_TTY=$(tty)
#export GPG_TTY
#}}}

# less colors for man pages {{{
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_me=$'\E[0m'           # end blinking
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold / blue
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_so=$'\E[00;40;01;32m' # begin standout-mode (info box)
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\E[01;33m'       # begin underline
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#}}}

# console colours & cope {{{
if [ "$TERM" = "linux" ]; then
  conpalette euphrasia
fi
#}}}

# startx {{{
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx -- -nolisten tcp vt1 &>/dev/null
  logout
elif [[ $(tty) = /dev/tty2 ]]; then
  tmux
fi
#}}}

# vim:ft=sh:fdm=marker
