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
        echo "created $temp_dir without a name"
        mkdir -p "$temp_dir"; and cd "$temp_dir"
        return 1
    else if test "$argv[1]" = "c"
        rm -rf /tmp/t/*
        echo "deleted all files inside /tmp/t"
    else
        set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
        set temp_dir "/tmp/t/$argv[1]_$random_chars"
        mkdir -p "$temp_dir"; and cd "$temp_dir"
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

function zst
    tar --zstd -cvf "$argv[1].tar.zst" $argv[1]
end

function ex --description "Expand or extract bundled & compressed files"
  set --local ext (echo $argv[1] | awk -F. '{print $NF}')
  switch $ext
    case tar  # non-compressed, just bundled
      tar -xvf $argv[1]
    case gz
      if test (echo $argv[1] | awk -F. '{print $(NF-1)}') = tar  # tar bundle compressed with gzip
        tar -zxvf $argv[1]
      else  # single gzip
        gunzip $argv[1]
      end
    case tgz  # same as tar.gz
      tar -zxvf $argv[1]
    case bz2  # tar compressed with bzip2
      tar -jxvf $argv[1]
    case rar
      unrar x $argv[1]
    case zip
      unzip $argv[1]
    case '*'
      echo "unknown extension"
  end
end
