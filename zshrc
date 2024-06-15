test -z "$PS1" && exit

autoload -U compinit; compinit
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PS1='%T %/> '

export BROWSER="firefox"
export EDITOR="micro"

export HISTTIMEFORMAT="%F %T "
export HISTSIZE=
export HISTFILESIZE=

export PYTHONSTARTUP="$HOME/Media/Code/Configs/python_startup.py"

export PATH="$PATH:$HOME/Media/Code/scripts"
export PATH="$PATH:$HOME/Media/Code/scripts/tarscrypt"
export PATH="$PATH:$HOME/Media/Code/scripts/cryptsetupui"
export PATH="$PATH:$HOME/Media/Code/scripts/minigames"
export PATH="$PATH:$HOME/Media/Code/rofi"
export PATH="$PATH:$HOME/Media/Code/sync"
export PATH="$PATH:$HOME/Media/Code/Tree"

# quick access
alias notepad='micro $HOME/Media/Random/notepad.txt'
alias diary='sh $HOME/Media/Random/Diary/open.sh'

# abbreviations
alias e='exit'
alias s='sudo'
alias hexdump='hexdump --canonical'
alias sc='sudo cryptsetup'
alias feh='feh -d  --scale-down'
alias gpg='gpg --pinentry-mode loopback'
alias copy='xclip -sel c'
alias upper='tr [:lower:] [:upper:]'
alias lower='tr [:upper:] [:lower:]'
alias tb='nc termbin.com 9999'
alias disks='watch -n 0.1 lsblk -o NAME,SIZE,FSTYPE,FSUSE%,MOUNTPOINT'
alias nanos='date +"%s%N"'
alias yt='yt-dlp --downloader aria2c'
alias si='stat -c %s'
alias '..'='cd ..'
alias '...'='cd .. && cd ..'
alias '....'='cd .. && cd .. && cd ..'
alias '.....'='cd .. && cd .. && cd .. && cd ..'

# short
alias lsblk='lsblk -o NAME,SIZE,FSTYPE,FSUSE%,MOUNTPOINT'
alias l='lsblk -o NAME,SIZE,FSTYPE,FSUSE%,MOUNTPOINT;echo;df -h -x tmpfs -x efivarfs | sed '2d''
alias lb='lsblk'
alias gu='gitui'
alias m='micro'
alias ra='ranger'
alias p='python3'
alias ju='julia'

# long?
alias listblock='lsblk'
alias list='ls'

# options
alias base64='base64 -w0' 
alias du='du -h'
alias grep='grep'
alias cp='cp -iv'
alias cat='bat -pp'
alias ls='ls --group-directories-first -ltrGh'

# apt
alias i='yay -S --noconfirm'
alias r='yay -R'
alias u='yay -Syu'

# i3 
alias abbreviations='micro ~/.config/fish/abbreviations.fish'
alias config='micro ~/.config/i3/config'
alias config2='micro ~/.config/i3status/config'

# ollama
alias ai='ollama run llama2:13b --nowordwrap'
alias ai2='ollama run tinyllama:1.1b --nowordwrap'
alias aimini='ollama run qwen:0.5b --nowordwrap'

# navigation
alias cdM='cd ~/Media'
alias cdC='cd ~/Media/Code/Configs'
alias cdP='cd ~/Media/Code/Projects'
alias cds='cd ~/Media/Code/scripts'
alias cdr='cd ~/Media/Code/rofi'
alias cdp='cd ~/Media/Random/Pics'
alias cdv='cd ~/Media/Random/Vids'
alias cdR='cd ~/Media/Random'

fish

