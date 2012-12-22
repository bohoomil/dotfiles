# source .bashrc {{{
if [ -r ~/.bashrc ]; then 
	. ~/.bashrc; 
fi
#}}}

# environmental defaults {{{
export GPGKEY="6E32FD72"
export EDITOR="vim"
export FCEDIT="vim"
export VISUAL="vim"
export BROWSER="dwb"
export QT_XFT=true
export GDK_USE_XFT=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd_hrgb'
export TIME_STYLE=long-iso
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export GSETTINGS_BACKEND=dconf
#export http_proxy="localhost:8118"
#}}}

# tmux on tty2 {{{
if [[ $(tty) = /dev/tty2 ]]; then
	tmux
fi
#}}}

# Less Colors for Man Pages {{{
export LESS="-aMRS#2"
export LESS_TERMCAP_mb=$'\E[01;31m'    # begin blinking
export LESS_TERMCAP_me=$'\E[0m'        # end blinking
export LESS_TERMCAP_md=$'\E[01;34m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # end mode
export LESS_TERMCAP_so=$'\E[01;41;37m' # begin standout-mode (info box)
export LESS_TERMCAP_se=$'\E[0m'        # end standout-mode
export LESS_TERMCAP_us=$'\E[00;33m'    # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # end underline
#}}}

# console colours & cope {{{
if [ "$TERM" = "linux" ]; then
	conpalette euphrasia
fi

PATH=/usr/share/perl5/site_perl/auto/share/dist/Cope:$PATH
#}}}
# vim:ft=sh:fdm=marker
