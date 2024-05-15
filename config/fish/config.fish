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

    set -gx PATH $PATH ~/Media/Code/Tree
    set -gx PATH $PATH ~/Media/Code/rofi
    set -gx PATH $PATH ~/Media/Code/scripts
    set -gx PATH $PATH ~/Media/Code/sync

    export PYTHONSTARTUP="$HOME/Media/Code/Configs/python_startup.py"
end
