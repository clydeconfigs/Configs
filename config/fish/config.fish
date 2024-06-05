# ~/.config/fish/config.fish

if status --is-interactive
    function fish_prompt
        set -l last_status $status
        set -l stat
        if test $last_status -ne 0
            set stat (set_color red)" [$last_status]"(set_color normal)
        end
        echo -n (date +"%T")" "
        set_color yellow
        echo -n (prompt_pwd)
        set_color normal
        echo -n (set_color red)"$stat"(set_color normal)
        echo -n '>'
    end

    source ~/.config/fish/abbreviations.fish

    set fish_prompt_pwd_dir_length 0

    set -g fish_greeting (echo)

    set -gx BROWSER "firefox"
    set -gx EDITOR "micro"

    set -gx HISTTIMEFORMAT "%F %T "
    set -gx HISTSIZE
    set -gx HISTFILESIZE

    set -gx PATH $PATH (find $HOME/Media/Code/scripts -maxdepth 2 -type f -exec dirname {} \; | grep -v git | sort -u)
    set -gx PATH $PATH "$HOME/Media/Code/rofi"
    set -gx PATH $PATH "$HOME/Media/Code/sync"
    set -gx PATH $PATH "$HOME/Media/Code/Tree"

    export PYTHONSTARTUP="$HOME/Media/Code/Configs/python_startup.py"
end
