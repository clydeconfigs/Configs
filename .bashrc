#
# ~/.bashrc
#

export PATH="$PATH:~/Media/shell"
export PATH="$PATH:~/Media/pw"

export EDITOR=micro

HISTSIZE= 
HISTFILESIZE=

PS1="\w>"

[[ $- != *i* ]] && return

echo $(date +"%a, %d %b %Y %T %Z")

# aliases
alias cp='cp -iv'
alias cat='bat -pp'
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
alias p='/usr/bin/python3'
alias l='lua5.4'

# apt
alias i='yay -S --noconfirm'
alias r='yay -R'
alias u='yay -Syu'
alias s='yay'

# i3 
alias config='micro .config/i3/config'
alias config2='micro .config/i3status/config'

# mini functions
diary() { sh $HOME/Media/Random/Diary/open.sh ; }
notepad() { micro $HOME/Media/Random/notepad.txt ; }
mouse() { xinput set-prop "SINOWEALTH GXT 970 Gaming Mouse" "libinput Accel Speed" -0.5 ; }

# sync hdd
synclocal() { lsblk; read -p "Do you want to continue? (y/n): " && [[ -z "$REPLY" ]] || [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program..."; sh ~/Media/shell/sync/copy_and_sync_local_hdd.sh ; }
syncexternal() { lsblk; read -p "Do you want to continue? (y/n): " && [[ -z "$REPLY" ]] || [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program..."; sh ~/Media/shell/sync/sync_external_hdd.sh || sh ~/Media/shell/sync/sync_external_hdd2.sh; }
copyconfigs() { sh Media/shell/sync/copy_configs.sh ; }

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
