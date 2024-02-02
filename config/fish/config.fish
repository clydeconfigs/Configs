# ~/.config/fish/config.fish

fish_default_key_bindings

set -g fish_greeting (date +"%a, %d %b %Y %T %Z")

function fish_prompt
    set_color green
    echo -n (prompt_pwd)
    set_color normal
    echo -n '>'
end

set -gx PATH $PATH ~/Media/Code/tools
set -gx PATH $PATH ~/Media/Code/shell

source ~/.config/fish/functions.fish
source ~/.config/fish/abbreviations.fish

set -gx BROWSER "waterfox"

set -gx EDITOR "micro"

set -gx HISTTIMEFORMAT "%F %T "
set -gx HISTSIZE
set -gx HISTFILESIZE

if status is-login
    echo (date +"%a, %d %b %Y %T %Z")
end
