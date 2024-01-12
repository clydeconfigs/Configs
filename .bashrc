#
# ~/.bashrc
#

export PATH="$PATH:~/Media/shell"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\e[1;34m\]\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\n\[\e[1;31m\]> \[\e[0m\]"
PS1="\w>"

echo -n $(date +"%a, %d %b %Y %T %Z")
#echo -n " | " 
echo

export EDITOR=micro

function copy() {
  xclip -sel clipboard <<< "$(eval "$@")"
}

function mcd() {
	mkdir "$1" && cd "$1"
}

function f() {
	stat "$1"
	file "$1"
	sha256sum "$1"
	realpath "$1"
}


alias mouse='xinput set-prop "SINOWEALTH GXT 970 Gaming Mouse" "libinput Accel Speed" -0.5'
alias ws='i3-msg -t get_workspaces | jq -r ".[] | \"\(.num)\\t\(.focused)\""'
alias random='head /dev/urandom -c 10 | base32'
alias disks='watch -n 0.1 lsblk'
alias sec='pwgen -syn1 19'

alias S='BROWSER=w3m ddgr -n 2'
alias def='BROWSER=w3m ddgr -n 2 dle rae "$@"'

alias bs='echo \\ Ctrl+U 005C; echo -n "\\" | xclip -selection clipboard'

# developing
alias python='/usr/bin/python3'
alias p='/usr/bin/python3'
alias lua='lua5.4'
alias l='lua5.4'

# diary & notepad
alias diary='sh $HOME/Media/Random/Diary/open.sh'
alias notepad='micro $HOME/Media/Random/notepad.txt'

# aliases
alias nano='date +"%s%N"'
alias ai='ollama run mistral'
alias yt='yt-dlp --downloader aria2c'
alias ..='cd ..'
alias ...='cd .. && cd ..'
alias m='micro'
alias e='emacs -nw'
alias ra='ranger'
alias c='gcc -o cprogram'
alias du='du -h'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias si='stat -c %s'

# apt
alias i='yay -S --noconfirm'
alias r='yay -R'
alias u='yay -Syu'
alias s='yay'

# i3 
alias config='micro .config/i3/config'
alias config2='micro .config/i3status/config'

# sync hdd
alias synclocal='lsblk; read -p "Do you want to continue? (Press Enter for Yes): " && [[ -z "$REPLY" ]] || [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program..."; sh ~/Media/shell/sync/copy_and_sync_local_hdd.sh'
alias syncexternal='lsblk; read -p "Do you want to continue? (Press Enter for Yes): " && [[ -z "$REPLY" ]] || [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program..."; sh ~/Media/shell/sync/sync_external_hdd.sh'

# copy configs
alias copyconfigs='sh Media/shell/sync/copy_configs.sh'
