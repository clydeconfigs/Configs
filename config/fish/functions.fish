function cc
    gcc -o $argv[1] $argv[2]
end

function dif
    diff -u $argv[1] $argv[2] | diff-so-fancy | grep -vE "renamed: |────"
end

function diary
    sh $HOME/Media/Random/Diary/open.sh
end

function notepad
    micro $HOME/Media/Random/notepad.txt
end

function mouse
    xinput set-prop "SINOWEALTH GXT 970 Gaming Mouse" "libinput Accel Speed" -0.5
end

function synclocal
    lsblk
    sh ~/Media/Code/shell/sync/copy_and_sync_local_hdd.sh
end

function syncexternal
    lsblk
    sh ~/Media/Code/shell/sync/sync_external_hdd.sh; or sh ~/Media/Code/shell/sync/sync_external_hdd2.sh
end


function copyconfigs
    sh $HOME/Media/Code/shell/sync/copy_configs.sh
end

function t
    if test (count $argv) -lt 1
        set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
        set temp_dir "/tmp/t/$random_chars"
        echo "Created $temp_dir without a name. Remember, to create with a name use: t <directory_name>"
        mkdir -p "$temp_dir"; and cd "$temp_dir"
        return 1
    else if test "$argv[1]" = "c"
        rm -rf /tmp/t/*
        echo "Deleted all files inside /tmp/t"
    else
        set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
        set temp_dir "/tmp/t/$argv[1]_$random_chars"
        mkdir -p "$temp_dir"; and cd "$temp_dir"
    end
end

function ex
    if test -f $argv[1]
        switch $argv[1]
            case *.tar.bz2
                tar xjf $argv[1]
            case *.tar.gz
                tar xzf $argv[1]
            case *.bz2
                bunzip2 $argv[1]
            case *.rar
                unrar x $argv[1]
            case *.gz
                gunzip $argv[1]
            case *.tar
                tar xf $argv[1]
            case *.tbz2
                tar xjf $argv[1]
            case *.tgz
                tar xzf $argv[1]
            case *.zip
                unzip $argv[1]
            case *.Z
                uncompress $argv[1]
            case *.7z
                7z x $argv[1]
            case *.deb
                ar x $argv[1]
            case *.tar.xz
                tar xf $argv[1]
            case *.tar.zst
                unzstd $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via ex()"
        end
    else
        echo "'$argv[1]' is not a valid file"
    end
end

function g
    if count $argv = 0
        cd (dirname (fzf))
    else if test "$argv[1]" = "c"
        echo -n (fzf) | xclip -sel clipboard
    else if test "$argv[1]" = "mpv"
        mpv (fzf)
    end
end
