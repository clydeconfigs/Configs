#
# ~/.bashrc
#

export PATH="$PATH:~/Media/shell"
export PATH="$PATH:~/Media/pw"

HISTSIZE= 
HISTFILESIZE=

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1="\[\e[1;34m\]\[\e[1;32m\]\u@\h \[\e[1;33m\]\w\n\[\e[1;31m\]> \[\e[0m\]"
PS1="\w>"

echo  $(date +"%a, %d %b %Y %T %Z")

export EDITOR=micro

# developing
alias python='/usr/bin/python3'
alias p='/usr/bin/python3'
alias lua='lua5.4'
alias l='lua5.4'

# diary & notepad
alias diary='sh $HOME/Media/Random/Diary/open.sh'
alias notepad='micro $HOME/Media/Random/notepad.txt'

# aliases
alias mouse='xinput set-prop "SINOWEALTH GXT 970 Gaming Mouse" "libinput Accel Speed" -0.5'
alias bs='echo \\ Ctrl+U 005C; echo -n "\\" | xclip -selection clipboard'
alias disks='watch -n 0.1 lsblk'
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

# places to go, me to see
alias mm="cd ~/Media"
alias d="cd ~/Desktop"

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

#
# bloated functions below... careful!
#

function t() {
	if [ $# -lt 1 ]; then
	  random_chars=$(tr -dc "a-z" </dev/urandom | head -c 10)
	  temp_dir="/tmp/t/$random_chars"
	  echo "Created $temp_dir without a name. Remember, to create with a name use: t <directory_name>"
	  mkdir -p "$temp_dir" && cd "$temp_dir"
	  return 1
	elif [ "$1" == "c" ]; then
	  rm -rf /tmp/t/*
	  echo "Deleted all files inside /tmp/t"
	else
	  random_chars=$(tr -dc "a-z" </dev/urandom | head -c 10)
	  temp_dir="/tmp/t/$1_$random_chars"
	  mkdir -p "$temp_dir" && cd "$temp_dir"
	fi
}

function g() {
  if [ "$#" -eq 0 ]; then
    cd "$(dirname "$(fzf)")"
  elif [ "$1" == "c" ]; then
   	echo -n \"$(fzf)\" | xclip -sel clipboard
  elif [ "$1" == "mpv" ]; then
   	mpv "$(fzf)"
  fi
}

function eo() {
	device="/dev/sda1"
	
	test $# -eq 1 && device="$1"
	test ! -e /mnt/lol && mkdir /mnt/lol

	sudo cryptsetup luksOpen $device lol &&\
	sudo mount /dev/mapper/lol /mnt/lol
}

function ec() {
	device="/dev/sda1"
	
	test $# -eq 1 && device="$1"
		
	sudo umount /dev/mapper/lol &&\
	sudo cryptsetup luksClose lol
}
