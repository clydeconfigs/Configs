#   __                  _   _
#  / _|_   _ _ __   ___| |_(_) ___  _ __  ___
# | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
# |  _| |_| | | | | (__| |_| | (_) | | | \__ \
# |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
#

# start of 't' function family
#

function t
    if test (count $argv) -lt 1
        set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
        set temp_dir "/tmp/t/$random_chars"
        echo "created $temp_dir without a name"
        mkdir -p "$temp_dir"; and cd "$temp_dir"
        return 1
    else if test "$argv[1]" = "c"
        if test -e /tmp/t
            set size (du -h /tmp/t | awk '{print $1}' | tail -n1)
            rm -rf /tmp/t
            echo "deleted $size of files inside /tmp/t"
        else
            echo "/tmp/t doesn't exist"
        end
    else
        set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
        set temp_dir "/tmp/t/$argv[1]_$random_chars"
        mkdir -p "$temp_dir"; and cd "$temp_dir"
    end
end

function ct
    if test (count $argv) -lt 1
        echo "input the name or content of the name of the /tmp/t/ folder you want to cd into"
        exit 1
    else
        cd /tmp/t/(ls /tmp/t | grep $argv[1])
    end
end

function tt
    tree /tmp/t/
end

#
# end of 't' function family

# start of 'cryptsetup LUKS' function family
#

function eo
    if test (count $argv) -eq 1
        set device $argv[1]
    
        set lol (basename $device)
    
        if not test -e /mnt/$lol
            sudo mkdir /mnt/$lol
        end
    
        if sudo cryptsetup luksOpen /dev/$device $lol; and sudo mount /dev/mapper/$lol /mnt/$lol
            echo "[eo] mounted at /mnt/$lol"
        else
            sudo mount /dev/$device /mnt/$lol
            echo "[eo] mounted at /mnt/$lol"
        end
    end
end

function ec
    if test (count $argv) -eq 1
        set device $argv[1]

        set lol (basename $device)

        if sudo umount /dev/mapper/$lol; and sudo cryptsetup luksClose $lol
            echo "[ec] unmounted"
        else
            sudo umount /mnt/$lol
            echo "[ec] unmounted"
        end
    end

    sync
end

#
# end of 'cryptsetup LUKS' function family

function b
    bash -c "$argv"
end

function upload
    if test (count $argv) -lt 1
        curl -F 'file=@-' 0x0.st 
    else
        curl -F 'file=@-' 0x0.st < $argv[1]
    end
end

function upload2
    if test (count $argv) -lt 1
        curl -F 'f:1=<-' ix.io 
    else
        curl -F 'f:1=<-' ix.io < $argv[1]
    end
end

function junk
    cat /usr/share/dict/spanish | sed 's/\b.*\b/&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n/' | shuf | tail -n $argv[1] | tr \n " "
end

function l
    lsblk && \
    echo && \
    df -h -x tmpfs -x efivarfs | sed '2d'
end

function quote_all
    grep " No\.[0-9][0-9][0-9][0-9]" $argv[1] | cut -c 35-42 | sed 's/\./>>/g' | tr \n " "
end

function remove_comments
    sed -i 's#//.*$##g' $argv[1]
end

function bs 
    echo \\ Ctrl+U 005C; echo -n "\\" | xclip -selection clipboard && xmodmap -e "clear Lock" -e "keycode 66 = backslash"
end

function lst
    find . -maxdepth 1 -type f -exec sh -c 'echo -e "$(basename "{}")  $(file --mime-type -b "{}")"' \;
end

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
    sh ~/Media/Code/sync/copy_configs_and_sync_local_hdd.sh
end

function syncexternal
    lsblk
    sh ~/Media/Code/sync/sync_external_hdd.sh
end

function copyconfigs
    sh $HOME/Media/Code/sync/copy_configs.sh
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

function zst
    if test (count $argv) -eq 2
        set -x ZSTD_CLEVEL $argv[2]
    else
        set -x ZSTD_CLEVEL 19
    end

    if string match -q "*/" "$argv[1]"
        set -x argv[1] (string split "" $argv[1] | head -n -1 | string join "")
    end

    tar --zstd -cvf "$argv[1].tar.zst" "$argv[1]"
end


function ex --description "Expand or extract bundled & compressed files"
  set --local ext (echo $argv[1] | awk -F. '{print $NF}')
  switch $ext
    case tar  
      tar -xvf $argv[1]
    case gz
      if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar 
        tar -zxvf $argv[1]
      else  
        gunzip $argv[1]
      end
    case tgz
      tar -zxvf $argv[1]
    case bz2
      tar -jxvf $argv[1]
    case rar
      unrar x $argv[1]
    case zip
      unzip $argv[1]
    case zst
      zstd -d $argv[1]
    case '*'
      echo "unknown extension"
  end
end
