# source .bashrc {{{
if [ -r ~/.bashrc ]; then
  . ~/.bashrc; 
fi
#}}}

# environmental defaults {{{
#export LC_ALL="en_US.UTF-8"
export EDITOR="vim"
export FCEDIT="vim"
export VISUAL="vim"
export CHROOT=/mnt/sda2/ArchBuilds
export BROWSER="dwb"
export QT_XFT=true
export GDK_USE_XFT=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd_hrgb'
export TIME_STYLE=long-iso
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export LESSOPEN='|$HOME/.local/bin/lesspipe.sh %s 2>&-'
export LESSCOLORIZER=pygmentize
export LESSCOLOR=2
export LESS='-i -n -c -z-4 -g -M -R'
export LESSCHARSET='utf-8'
export VIEWER="less -i -n -c -z-4 -g -M -R"
export PAGER="less -i -n -c -z-4 -g -M -R"
export SAL_USE_VCLPLUGIN="gtk lowriter"

export SYSTEMD_PAGER="less -j4aRc"
alias wine='schroot -pqd "$(pwd)" -- wine'
#export GSETTINGS_BACKEND=dconf
#export http_proxy="localhost:8118"

# vim-bash-support prompts
export PS2='continue> '
export PS3='choose: '
export PS4='|${BASH_SOURCE} ${LINENO}${FUNCNAME[0]:+ ${FUNCNAME[0]}()}|  '
#}}}

# Less Colors for Man Pages {{{
export LESS="-aMRS#2"
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_me=$'\E[0m'           # end blinking
export LESS_TERMCAP_md=$'\E[01;34m'       # begin bold / blue
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_so=$'\E[00;41;01;37m' # begin standout-mode (info box)
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_us=$'\E[00;33m'       # begin underline
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
#}}}

# console colours & cope {{{
if [ "$TERM" = "linux" ]; then
  conpalette euphrasia
fi
#}}}

# startx {{{
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx -- -nolisten tcp -dpi 96 vt1 &>/dev/null
  logout
elif [[ $(tty) = /dev/tty2 ]]; then
  tmux
fi
#}}}

# vim:ft=sh:fdm=marker
