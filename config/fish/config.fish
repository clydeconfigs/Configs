# ~/.config/fish/config.fish

fish_default_key_bindings

bind \cd 'kill-bigword'

set -g fish_greeting (date +"%a, %d %b %Y %T %Z")

set fish_prompt_pwd_dir_length 0

function fish_prompt
    set_color yellow
    echo -n (prompt_pwd)
    set_color normal
    echo -n '>'
end

set -gx PATH $PATH ~/Media/Tree
set -gx PATH $PATH ~/Media/Code/shell
set -gx PATH $PATH ~/Media/Code/shell/expanded

source ~/.config/fish/functions.fish
source ~/.config/fish/abbreviations.fish

export PASSWORD_STORE_DIR="$HOME/Media/Sensible/pass/password-store"

set -gx BROWSER "waterfox"
set -gx EDITOR "micro"

set -gx HISTTIMEFORMAT "%F %T "
set -gx HISTSIZE
set -gx HISTFILESIZE

if status is-login
    echo (date +"%a, %d %b %Y %T %Z")
end
