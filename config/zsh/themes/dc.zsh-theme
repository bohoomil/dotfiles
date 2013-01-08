if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="cyan"; fi
PROMPT='%{$fg_no_bold[$NCOLOR]%}[%1~] $(git_prompt_info)%{$fg_bold[green]%}\$%{$reset_color%} '
#RPROMPT='[%*]'
#»

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}(%{$fg_no_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_no_bold[cyan]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_no_bold[yellow]%}√%{$fg_no_bold[cyan]%})"

