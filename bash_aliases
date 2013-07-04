# vim:ft=sh

# Normal aliases
alias ls="BLOCK_SIZE=\'1 ls -F --color=auto" #thousands grouping
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -l --sort=t'
alias lss='ls++'
alias f='find |grep'
alias dir='dir --color=auto'
alias grep="grep --color=auto"
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hist="grep '$1' /home/bohoomil/.bash_history"
alias irssi="irssi -c irc.freenode.net -n yyz"
alias mem="free -m"
alias IP='$HOME/.local/bin/iploc.sh'
alias newsbeuter='NOCOPE=1 newsbeuter'
alias podbeuter='NOCOPE=1 podbeuter'
alias bashburn='NOCOPE=1 bashburn'
alias info='pinfo'
#alias cdemu='cdemu -b system'
alias feh="feh --scale-down -F"
alias bc='bc -l'
alias hd='df -h -t ext4'
alias su='su -'
alias iftop='sudo iftop -c ~/.iftop.conf'
alias mupdf='mupdf -b 8'
alias ytdl="youtube-dl -f 18 --max-quality=35 -t"
alias gparted='urxvtc -geometry "70x10" -e sh -c "sudo gparted"'
alias adobe-air="schroot -p -- adobe-air"
alias todo="ctodo /mnt/sda3/documents/0_notes/todo.txt"

alias manl='PAGER='\''less -X'\'' man'
alias manv='PAGER=vimpager man'
alias w2do='w2do -C'

alias homer="ssh bohoomil@homer"
alias bkp_sftp='sftp -F ~/.ssh_config bohoomil@host.com'

# pm
alias shut='sudo poweroff'

# devel
alias pacman='sudo pacman'
alias upgrade='sudo pacman -Syu'
alias latexmk='latexmk -xelatex -pvc -interaction=nonstopmode'

## dwm settings
alias dwmrc="cd /mnt/sda2/arch-pkgs/abs/dwm && vim config.h && makepkg -f -ic && cd"

# Mounts
alias ua='devmon --unmount-all --no-gui'
alias um='udevil mount'
alias uu='udevil umount'

# Places
alias bkp='cd /mnt/sda2/BACKUP'
alias soft='cd /mnt/sda2/software'
alias eb='cd /mnt/sda3/documents/eBooks'
alias not='cd /mnt/sda3/documents/0_notes'
alias vid='cd /mnt/sda3/videos'
alias doc='cd /mnt/sda3/documents'
alias short='cd /mnt/sda3/documents/projects/short_notebook'
alias rec='cd /mnt/sda3/recent'
alias pro='cd /mnt/sda2/projects'
alias pic='cd /mnt/sda3/pictures'
alias dw='cd /mnt/sda3/downloads'
alias pkg='cd /mnt/sda2/arch-pkgs'
alias bin='cd /home/bohoomil/.local/bin'
alias cd2='cd /mnt/sda2'
alias cd3='cd /mnt/sda3'
# VPN
alias vpnu='sudo systemctl start openvpn@openvpn.service'
alias vpnd='sudo systemctl stop openvpn@openvpn.service'
alias vpnr='sudo systemctl restart openvpn@openvpn.service'
alias netspeedwlp='netspeed.sh wlp2s0'

# hg
alias hgp='hg pull'
alias hgu='hg update'

# cue2tracks
# *.cue file = CDImage.cue
alias cuefl='cue2tracks -C -c flac -o "%N %t" *.cue'
alias cueflr='cue2tracks -CR -c flac -o "%N %t" *.cue'
alias cuemp3='cue2tracks -C -c mp3 -B 320 -o "%N %t" *.cue'
alias cuemp3r='cue2tracks -CR -c mp3 -B 320 -o "%N %t" *.cue'
alias ripcue='abcde -1 -o flac -a default,cue'

# tagging
# flac & mp3
alias tagmp3="mp3info -x"
alias tagflac="metaflac --show-tag=TITLE --show-tag=ARTIST --show-tag=ALBUM --show-tag=TRACKNUMBER --show-tag=GENRE --show-tag=COMMENT --show-tag=DATE --show-sample-rate --show-channels"

# borrowed from oh-my-zsh
# Show progress while file is copying
# Rsync options are:
#  -p - preserve permissions
#  -o - preserve owner
#  -g - preserve group
#  -h - output in human-readable format
#  --progress - display progress
#  -b - instead of just overwriting an existing file, save the original
#  --backup-dir=/tmp/rsync - move backup copies to "/tmp/rsync"
#  -e /dev/null - only work on local files
#  -- - everything after this is an argument, even if it looks like an option

alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias mvv="rsync -av --progress -h --remove-source-files"
alias rsync-update="rsync -avu --progress -h"
alias rsync-synchronize="rsync -avu --delete --progress -h"

