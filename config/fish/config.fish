# ~/.config/fish/config.fish

function fish_prompt
    echo -n (date +"%T")" "
    set_color yellow
    echo -n (prompt_pwd)
    set_color normal
    echo -n '>'
end

export PYTHONSTARTUP="$HOME/Media/Code/Configs/Other/python_startup.py"
export PASSWORD_STORE_DIR="$HOME/Media/Sensible/pass/password-store"
export KEYS_DIR="$HOME/Media/Sensible/keys_database"

source ~/.config/fish/abbreviations.fish

# set -g fish_greeting (date +"%a, %d %b %Y %T %Z")

set -g fish_greeting (echo)

set fish_prompt_pwd_dir_length 0

set -gx PATH $PATH ~/Media/Code/Tree
set -gx PATH $PATH ~/Media/Code/rofi
set -gx PATH $PATH ~/Media/Code/scripts

set -gx BROWSER "firefox"
set -gx EDITOR "micro"

set -gx HISTTIMEFORMAT "%F %T "
set -gx HISTSIZE
set -gx HISTFILESIZE

cd
