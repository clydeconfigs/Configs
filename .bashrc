#
# ~/.bashrc
#

fish

source ~/.bash_functions

export BROWSER="waterfox"

export PATH="$PATH:~/Media/Code/tools"
export PATH="$PATH:~/Media/Code/shell"

export EDITOR=micro

export HISTTIMEFORMAT="%F %T "
export HISTSIZE= 
export HISTFILESIZE=

PS1="\[\033[32m\]\w\[\033[0m\]>"

[[ $- != *i* ]] && return

echo $(date +"%a, %d %b %Y %T %Z")

# aliases
alias tb="nc termbin.com 9999"
alias bs='echo \\ Ctrl+U 005C; echo -n "\\" | xclip -selection clipboard'
alias disks='watch -n 0.1 lsblk'
alias nano='date +"%s%N"'
alias ai='ollama run mistral'
alias yt='yt-dlp --downloader aria2c'
alias si='stat -c %s'
alias ..='cd ..'
alias ...='cd .. && cd ..'

alias m='micro'
alias e='emacs -nw'
alias ra='ranger'
alias p='python3'
alias l='lua5.4'
alias j='julia'

alias du='du -h'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cp='cp -iv'
alias cat='bat -pp'

# apt
alias i='yay -S --noconfirm'
alias r='yay -R'
alias u='yay -Syu'
alias s='yay'

# i3 
alias config='micro .config/i3/config'
alias config2='micro .config/i3status/config'
