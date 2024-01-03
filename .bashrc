#
# ~/.bashrc
#

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

function io() {
    local preserve_extension=false

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -p)
                preserve_extension=true
                shift
                ;;
            *)
                break
                ;;
        esac
    done

    input_file="$1"
    output_file="${preserve_extension:+${input_file%.*}.jpg}"

    if "$preserve_extension"; then
        ffmpeg -i "$input_file" "$output_file"
    else
        ffmpeg -i "$input_file" "${output_file%%.*}".jpg
    fi

    # Get sizes in KB and calculate the difference and percentage change
    input_size=$(du -k "$input_file" | cut -f1)
    output_size=$(du -k "$output_file" | cut -f1)
    
    difference=$((input_size - output_size))
    percentage_change=$(awk "BEGIN {print ($difference / $input_size) * 100}")

    echo -e "Input size: ${input_size}KB"
    echo -e "Output size: ${output_size}KB"
    echo -e "Size difference (Input - Output): ${difference}KB"
    echo -e "Percentage change: ${percentage_change}%"
    
    if [ "$difference" -lt 0 ]; then
        echo -e "\e[31mWarning: Output size is larger than input size!\e[0m"
    elif [ "$difference" -eq 0 ]; then
        echo -e "\e[33mNote: No size difference between input and output.\e[0m"
    else
        echo -e "\e[32mSuccess: Output size is smaller than input size by ${difference}KB (${percentage_change}% smaller).\e[0m"
    fi
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
alias synclocal='lsblk;read -p "Do you want to continue? (Yes/No): " && [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program...";sh ~/Media/shell/sync/copy_and_sync_local_hdd.sh'
alias syncexternal='lsblk;read -p "Do you want to continue? (Yes/No): " && [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program...";sh ~/Media/shell/sync/sync_external_hdd.sh'

# copy configs
alias copyconfigs='sh Media/shell/sync/copy_configs.sh'
