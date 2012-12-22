# .bashrc for Arch Linux, user mode
# many bits shamelessly stolen from jwr

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt {{{
set_prompt_style () {
  local USER_COLOR="\[\033[0;36m\]"  #Cyan
  local HOST_COLOR="\[\033[1;36m\]"  #Cyan
  local DIR_COLOR="\[\033[0;36m\]"   #Cyan
  local RESET_COLOR="\[\033[0m\]"    #White
  local SYMBOL="\$"

  if [ `whoami` == "root" ] ; then
    USER_COLOR="\[\033[0;31m\]"      #Light Red
    DIR_COLOR=$USER_COLOR
    SYMBOL="\\$"
  fi
  
  PS1="$HOST_COLOR[arch] $DIR_COLOR[\W] $USER_COLOR$SYMBOL$RESET_COLOR "
}
set_prompt_style
#}}}

# bash options {{{
shopt -s autocd         # change to named directory
shopt -s cdable_vars    # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell        # autocorrects cd misspellings
shopt -s checkwinsize   # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s histappend     # append to (not overwrite) the history file
shopt -s histreedit     # re-edit a failed history substitution
shopt -s dotglob        # include dotfiles in pathname expansion
shopt -s expand_aliases # expand aliases
shopt -s extglob        # enable extended pattern-matching features
shopt -s globstar       # recursive globbing
shopt -s progcomp       # programmable completion
shopt -s hostcomplete   # attempt hostname expansion when @ is at the beginning ofa word
shopt -s nocaseglob     # pathname expansion will be treated as case-insensitive

# sudo completion
complete -cf sudo

# bash completion
set show-all-if-ambiguous on

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

#}}}

# history {{{
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
unset HISTFILESIZE
HISTCONTROL=ignoreboth:erasedups
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
#HISTFILESIZE=

# don't append the following to history: consecutive duplicate
# commands, ls, bg and fg, and exit
#export HISTIGNORE='jobs:set -x:%1:%2'
export HISTIGNORE="&:[ ]*:ls*:mc:vim .bashrc:vim .bash_history"

# share history across all terminals
PROMPT_COMMAND='history -a; history -c; history -r'
export HISTSIZE PROMPT_COMMAND
#}}}

# various visual enhancements {{{
# visual bell
set bell-style visible

eval $(dircolors -b ~/.dir_colors)
export GREP_COLOR="1;31"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && eval "$(lesspipe.sh)"
#}}}

# functions {{{
# Note-taking macro courtsey jwr

n() {
  local arg files=()
  for arg; do
    files+=( ~/"documents/0_notes/$arg" )
  done
  ${EDITOR:-vi} "${files[@]}"
}

nls() {
  tree -CR --noreport $HOME/documents/0_notes | awk '{
  if (NF==1) print $1;
  else if (NF==2) print $2;
  else if (NF==3) printf "  %s\n", $3
  }'
}

# TAB completion for notes
_notes() {
  local files=($HOME/documents/0_notes/**/"$2"*)
  [[ -e ${files[0]} ]] && COMPREPLY=( "${files[@]##~/documents/0_notes}" )
}

complete -o default -F _notes n

# calc - simple calculator
# usage: calc <equation>
calc() { echo "$*" | bc; }

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1        ;;
      *.tar.gz)   tar xzf $1        ;;
      *.tar.xz)   tar xJf $1        ;;
      *.tar.lzma) tar --lzma -xf $1 ;;
      *.bz2)      bunzip2 $1        ;;
      *.rar)      rar x $1          ;;
      *.gz)       gunzip $1         ;;
      *.tar)      tar xf $1         ;;
      *.tbz2)     tar xjf $1        ;;
      *.tgz)      tar xzf $1        ;;
      *.zip)      unzip $1          ;;
      *.Z)        uncompress $1     ;;
      *.7z)       7z x $1           ;;
      *.xz)       unxz $1           ;;
      *.exe)      cabextract $1     ;;
      *.lha)      lha e $1          ;;
      *)          echo "\`$1': unrecognized archive type" || return 1 ;;
    esac
  else
    echo "\`$1' is not a valid file"
  fi
}

pack() {
  local FILE
  FILE=$1
  case $FILE in
    *.tar.bz2)  shift && tar cjf $FILE $* ;;
    *.tbz2)     shift && tar cjf $FILE $* ;;
    *.tar.gz)   shift && tar czf $FILE $* ;;
    *.tgz)      shift && tar czf $FILE $* ;;
    *.zip)      shift && zip $FILE $*     ;;
    *.rar)      shift && rar $FILE $*     ;;
  esac
}

# nwf stands for "notify when finished"
nwf() {
  "$@"
  if [ $? -gt 0 ]; then
    notify-send -u critical "$1 FAILED"
  else
    notify-send -u normal "$1 finished successfully"
  fi
}

forecast(){
curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-}"|perl -ne '/([^<]+)/&&printf "%s: ",$1;/([^<]+)/&&print $1,"\n"'|sed "s/&/\ /g"|sed "s/deg;//g";
}
#}}}
# vim:ft=sh:
