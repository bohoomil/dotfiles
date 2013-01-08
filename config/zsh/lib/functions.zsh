function zsh_stats() {
  history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

function uninstall_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/uninstall.sh
}

function upgrade_oh_my_zsh() {
  /usr/bin/env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
}

function take() {
  mkdir -p $1
  cd $1
}

# note taking function tweaks by jwr
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

#complete -o default -F _notes n

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


