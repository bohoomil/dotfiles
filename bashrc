# .bashrc for Arch Linux, user mode
# many bits shamelessly stolen from jwr

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# --- prompt {{{
set_prompt_style () {
  local USER_COLOR="\[\033[;33m\]"  #yellow
  local HOST_COLOR="\[\033[1;36m\]" #cyan
  local DIR_COLOR="\[\033[1;34m\]"  #blue
  local RESET_COLOR="\[\033[0m\]"   #White
  local SYMBOL="\$"

  if [ `whoami` == "root" ] ; then
    USER_COLOR="\[\033[0;31m\]"    #Light Red
    DIR_COLOR=$USER_COLOR
    SYMBOL="\\$"
  fi
  
  PS1="$DIR_COLOR[\W] $USER_COLOR$SYMBOL$RESET_COLOR "
}
set_prompt_style

export PS2='continue> '
export PS3='choose: '
export PS4='|${BASH_SOURCE} ${LINENO}${FUNCNAME[0]:+ ${FUNCNAME[0]}()}|  '
#}}}

# --- bash options {{{
shopt -s autocd         # change to named directory
shopt -s cdable_vars    # if cd arg is not valid, assumes its a var defining a dir
shopt -s cdspell        # autocorrects cd misspellings
shopt -s checkwinsize   # update the value of LINES and COLUMNS after each command if altered
shopt -s cmdhist        # save multi-line commands in history as single line
shopt -s histappend     # append to (not overwrite) the history file
shopt -s histreedit     # re-edit a failed history substitution
shopt -s histverify
shopt -s dotglob        # include dotfiles in pathname expansion
shopt -s expand_aliases # expand aliases
shopt -s extglob        # enable extended pattern-matching features
shopt -s globstar       # recursive globbing
shopt -s progcomp       # programmable completion
shopt -s hostcomplete   # attempt hostname expansion when @ is at the beginning ofa word
shopt -s nocaseglob     # pathname expansion will be treated as case-insensitive

# bash completion
set show-all-if-ambiguous on

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
#}}}

# --- history {{{
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
export HISTIGNORE="&:[ ]*:mc:vim .bashrc:vim\ .bash_history:man\ *"

# share history across all terminals
PROMPT_COMMAND='history -a; history -c; history -r'
export HISTSIZE PROMPT_COMMAND
#}}}

# --- various visual enhancements {{{
# visual bell
set bell-style visible

eval $(dircolors -b ~/.dir_colors)
export GREP_COLOR="1;31"

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe.sh ] && eval "$(lesspipe.sh)"
#}}}

# --- functions {{{
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

signpkgs() {
    for pkg in *.pkg.tar.xz; do gpg --detach-sign --default-key 962DDE58 $pkg; done
}

signpkg() {
    gpg --detach-sign --default-key 962DDE58 $1
}

tmprmhome() {
  find ~/ -name ".bash_history.tmp" -delete
}

tmprmsda2() {
  find /mnt/sda2 -name ".bash_history.tmp" -delete
}

tmprmsda3() {
  find /mnt/sda3 -name ".bash_history.tmp" -delete
}

usrsyms() {
  find /usr/share -type l ! -exec test -r {} \; -print
}

#}}}

# --- enhanced completion function {{{
#  This is a 'universal' completion function - it works when commands have
#+ a so-called 'long options' mode , ie: 'ls --all' instead of 'ls -a'
#  Needs the '-o' option of grep
#+ (try the commented-out version if not available).

#  First, remove '=' from completion word separators
#+ (this will allow completions like 'ls --color=auto' to work correctly).

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}

_get_longopts() {
  #$1 --help | sed  -e '/--/!d' -e 's/.*--\([^[:space:].,]*\).*/--\1/'| \
  #grep ^"$2" |sort -u ;
  $1 --help | grep -o -e "--[^[:space:].,]*" | grep -e "$2" |sort -u
}

_longopts() {
  local cur
  cur=${COMP_WORDS[COMP_CWORD]}

  case "${cur:-*}" in
    -*)      ;;
     *)      return ;;
  esac

  case "$1" in
    \~*)     eval cmd="$1" ;;
      *)     cmd="$1" ;;
  esac
  COMPREPLY=( $(_get_longopts ${1} ${cur} ) )
}
complete  -o default -F _longopts configure bash
complete  -o default -F _longopts wget id info a2ps ls recode

_tar() {
  local cur ext regex tar untar

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}

  # If we want an option, return the possible long options.
  case "$cur" in
      -*)     COMPREPLY=( $(_get_longopts $1 $cur ) ); return 0;;
  esac

  if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $( compgen -W 'c t x u r d A' -- $cur ) )
    return 0
  fi

  case "${COMP_WORDS[1]}" in
    ?(-)c*f)
      COMPREPLY=( $( compgen -f $cur ) )
      return 0
      ;;
      +([^Izjy])f)
      ext='tar'
      regex=$ext
      ;;
    *z*f)
      ext='tar.gz'
      regex='t\(ar\.\)\(gz\|Z\)'
      ;;
    *[Ijy]*f)
      ext='t?(ar.)bz?(2)'
      regex='t\(ar\.\)bz2\?'
      ;;
    *)
      COMPREPLY=( $( compgen -f $cur ) )
      return 0
      ;;
    esac

  if [[ "$COMP_LINE" == tar*.$ext' '* ]]; then
    # Complete on files in tar file.
    #
    # Get name of tar file from command line.
    tar=$( echo "$COMP_LINE" | \
     sed -e 's|^.* \([^ ]*'$regex'\) .*$|\1|' )
    # Devise how to untar and list it.
    untar=t${COMP_WORDS[1]//[^Izjyf]/}

    COMPREPLY=( $( compgen -W "$( echo $( tar $untar $tar \
     2>/dev/null ) )" -- "$cur" ) )
     return 0
  else
    # File completion on relevant files.
    COMPREPLY=( $( compgen -G $cur\*.$ext ) )
  fi
  return 0
}
complete -F _tar -o default tar

_make() {
  local mdef makef makef_dir="." makef_inc gcmd cur prev i;
  COMPREPLY=();
  cur=${COMP_WORDS[COMP_CWORD]};
  prev=${COMP_WORDS[COMP_CWORD-1]};
  case "$prev" in
    -*f)
      COMPREPLY=($(compgen -f $cur ));
      return 0
      ;;
  esac;
  case "$cur" in
    -*)
      COMPREPLY=($(_get_longopts $1 $cur ));
      return 0
      ;;
  esac;

  # ... make reads
  #          GNUmakefile,
  #     then makefile
  #     then Makefile ...
  if [ -f ${makef_dir}/GNUmakefile ]; then
    makef=${makef_dir}/GNUmakefile
  elif [ -f ${makef_dir}/makefile ]; then
    makef=${makef_dir}/makefile
  elif [ -f ${makef_dir}/Makefile ]; then
    makef=${makef_dir}/Makefile
  else
    makef=${makef_dir}/*.mk # Local convention.
  fi

  #  Before we scan for targets, see if a Makefile name was
  #+ specified with -f.
  for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
    if [[ ${COMP_WORDS[i]} == -f ]]; then
    # eval for tilde expansion
    eval makef=${COMP_WORDS[i+1]}
    break
    fi
  done
  [ ! -f $makef ] && return 0

  # Deal with included Makefiles.
  makef_inc=$( grep -E '^-?include' $makef |
    sed -e "s,^.* ,"$makef_dir"/," )
  for file in $makef_inc; do
    [ -f $file ] && makef="$makef $file"
  done

  #  If we have a partial word to complete, restrict completions
  #+ to matches of that word.
  if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi

  COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ \
     {split($1,A,/ /);for(i in A)print A[i]}' \
     $makef 2>/dev/null | eval $gcmd  ))
}
complete -F _make -X '+($*|*.[cho])' make gmake pmake

_killall() {
  local cur prev
  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}

  #  Get a list of processes
  #+ (the first sed evaluation
  #+ takes care of swapped out processes, the second
  #+ takes care of getting the basename of the process).
  COMPREPLY=( $( ps -u $USER -o comm  | \
    sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
    awk '{if ($0 ~ /^'$cur'/) print $0}' ))
  return 0
}
complete -F _killall killall killps

# Local Variables:
# mode:shell-script
# sh-shell:bash
# End:
#}}}

# vim:ft=sh:
