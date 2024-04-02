# ~/.config/fish/config.fish

function fish_prompt
    set_color yellow
    echo -n (prompt_pwd)
    set_color normal
    echo -n '>'
end

export PASSWORD_STORE_DIR="$HOME/Media/Sensible/pass/password-store"

source ~/.config/fish/abbreviations.fish

set -g fish_greeting (date +"%a, %d %b %Y %T %Z")

set fish_prompt_pwd_dir_length 0

set -gx PATH $PATH ~/Media/Code/Tree
set -gx PATH $PATH ~/Media/Code/rofi
set -gx PATH $PATH ~/Media/Code/scripts

set -gx BROWSER "waterfox"
set -gx EDITOR "micro"

set -gx HISTTIMEFORMAT "%F %T "
set -gx HISTSIZE
set -gx HISTFILESIZE
