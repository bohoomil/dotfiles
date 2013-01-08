# ls colors
autoload colors; colors;

[ -f $HOME/.dir_colors ] && eval $(dircolors -b $HOME/.dir_colors)
export ZLSCOLORS="${LS_COLORS}"
zmodload  zsh/complist

# Enable ls colors
if [ "$DISABLE_LS_COLORS" != "true" ]
then
  # Find the option for using colors in ls, depending on the version: Linux or BSD
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi

#setopt no_beep
setopt auto_cd
setopt multios
setopt cdablevarS

if [[ x$WINDOW != x ]]
then
    SCREEN_NO="%B$WINDOW%b "
else
    SCREEN_NO=""
fi

# Apply theming defaults
PS1="%n@%m:%~%# "

# git theming default: Variables for theming the git info prompt
ZSH_THEME_GIT_PROMPT_PREFIX="git:("         # Prefix at the very beginning of the prompt, before the branch name
ZSH_THEME_GIT_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_GIT_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean

# Less Colors for Man Pages
export LESS="-aMRS#2"
export LESS_TERMCAP_mb=$'\E[01;31m'    # begin blinking
export LESS_TERMCAP_me=$'\E[0m'        # end blinking
export LESS_TERMCAP_md=$'\E[01;34m'    # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # end mode
export LESS_TERMCAP_so=$'\E[01;41;37m' # begin standout-mode (info box)
export LESS_TERMCAP_se=$'\E[0m'        # end standout-mode
export LESS_TERMCAP_us=$'\E[00;33m'    # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # end underline

# Setup the prompt with pretty colors
setopt prompt_subst

