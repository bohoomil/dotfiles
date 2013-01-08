# vim:ft=sh

# Normal aliases
alias ls="BLOCK_SIZE=\'1 ls -F --color=auto" #thousands grouping
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lsd='ls -l --sort=t'
alias f='find |grep'
alias dir='dir --color=auto'
alias irssi="irssi -c irc.freenode.net -n yyz"
alias mem="free -m"
alias IP='$HOME/.local/bin/iploc.sh'
alias newsbeuter='NOCOPE=1 newsbeuter'
alias podbeuter='NOCOPE=1 podbeuter'
alias bashburn='NOCOPE=1 bashburn'
alias info='pinfo'
#alias cdemu='cdemu -b system'
alias gfv="gnome-font-viewer"
alias feh="feh --scale-down -F"
alias bc='bc -l'
alias hd='df -h -t ext4'
alias su='su -'
alias xx='sudo init 3 && sudo init 5 && clear && reset && exit'
alias po='sudo /etc/power/pwsave.sh'
alias iftop='sudo iftop -c ~/.iftop.conf'
alias mupdf='mupdf -b 8'
alias ytdl="youtube-dl -f 18 --max-quality=34 -t"
alias gparted='urxvtc -geometry "70x10" -e sh -c "sudo gparted"'
alias adobe-air="schroot -p -- adobe-air"

# pm
alias shut='sudo poweroff'

# devel
alias pacman='sudo pacman'
alias upgrade='sudo pacman -Syu'
alias latexmk='latexmk -xelatex -pvc -interaction=nonstopmode'

## dwm settings
alias dwmrc="cd $HOME/packages/custom/dwm-heresy-arch-sda1 && vim config.h && make clean && make && sudo make install && cd"

# Mounts
alias him='sudo mount -t davfs https://username.remotehost.com/ /mnt/remotedrive'
alias hiu='sudo umount /mnt/remotedrive'
alias ua='devmon --unmount-all --no-gui'
alias um='udevil mount'
alias uu='udevil umount'

# Places
alias bkp='cd /mnt/sda4/BACKUP'
alias data='cd /mnt/sda4'
alias fonts='cd /mnt/sda4/fonts'
alias icons='cd /mnt/sda4/icons'
alias soft='cd /mnt/sda3/software'
alias eb='cd /home/bohoomil/documents/eBooks'
alias not='cd /home/bohoomil/documents/0_notes'
alias vid='cd /home/bohoomil/videos'
alias doc='cd /home/bohoomil/documents'
alias short='cd /home/bohoomil/documents/projects/short_notebook'
alias rec='cd /mnt/sda4/recent'
alias pro='cd /mnt/sda4/projects'
alias pic='cd /home/bohoomil/pictures'
alias dw='cd /home/bohoomil/downloads'
alias pkg='cd /home/bohoomil/packages'
alias bin='cd /home/bohoomil/.local/bin'

# VPN
alias vpnu='sudo systemctl start openvpn@openvpn.service'
alias vpnd='sudo systemctl stop openvpn@openvpn.service'
alias vpnr='sudo systemctl restart openvpn@openvpn.service'

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

