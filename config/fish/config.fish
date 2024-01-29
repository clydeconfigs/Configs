# ~/.config/fish/config.fish

set -g fish_greeting (date +"%a, %d %b %Y %T %Z")

function fish_prompt
    set_color green
    echo -n (prompt_pwd)
    set_color normal
    echo -n '>'
end

source ~/.config/fish/functions.fish

set -gx BROWSER "waterfox"

set -gx PATH $PATH ~/Media/Code/tools
set -gx PATH $PATH ~/Media/Code/shell

set -gx EDITOR "micro"

set -gx HISTTIMEFORMAT "%F %T "
set -gx HISTSIZE
set -gx HISTFILESIZE

if status is-login
    echo (date +"%a, %d %b %Y %T %Z")
end

# abbreviations
abbr -a -g tb 'nc termbin.com 9999'
abbr -a -g bs 'echo \\ Ctrl+U 005C; echo -n "\\" | xclip -selection clipboard'
abbr -a -g disks 'watch -n 0.1 lsblk'
abbr -a -g nano 'date +"%s%N"'
abbr -a -g ai 'ollama run mistral'
abbr -a -g yt 'yt-dlp --downloader aria2c'
abbr -a -g si 'stat -c %s'
abbr -a -g .. 'cd ..'
abbr -a -g ... 'cd .. && cd ..'

abbr -a -g m 'micro'
abbr -a -g e 'emacs -nw'
abbr -a -g ra 'ranger'
abbr -a -g p 'python3'
abbr -a -g l 'lua5.4'
abbr -a -g j 'julia'

abbr -a -g du 'du -h'
abbr -a -g ls 'ls --color=auto'
abbr -a -g grep 'grep --color=auto'
abbr -a -g cp 'cp -iv'
abbr -a -g cat 'bat -pp'

# apt
abbr -a -g i 'yay -S --noconfirm'
abbr -a -g r 'yay -R'
abbr -a -g u 'yay -Syu'
abbr -a -g s 'yay'

# i3 
abbr -a -g config 'micro ~/.config/i3/config'
abbr -a -g config2 'micro ~/.config/i3status/config'
