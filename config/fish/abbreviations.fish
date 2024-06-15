function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# crazy temp things
function t; mkdir /tmp/t/ 2> /dev/null; set f (mktemp -d "/tmp/t/$argv[1]XXXXXXX"); cd $f; end
function ct; cd /tmp/t/(ls /tmp/t | grep $argv[1]); end

# disk watch
function disks
    while true
        sleep 0.5
        printf "\033[2J"  # Clear the screen
        printf "\033[1;1H"  # Move cursor to top-left corner
        l
    end
end

# quick access
abbr notepad 'micro $HOME/media/Random/notepad.txt'
abbr diary 'sh $HOME/media/Random/Diary/open.sh'

# abbreviations
abbr sf 'sf -ho'
abbr e 'exit'
abbr hexdump 'hexdump --canonical'
abbr sc 'sudo cryptsetup'
abbr feh 'feh -d  --scale-down'
abbr gpg 'gpg --pinentry-mode loopback'
abbr copy 'xclip -sel c'
abbr upper 'tr [:lower:] [:upper:]'
abbr lower 'tr [:upper:] [:lower:]'
abbr tb 'nc termbin.com 9999'
abbr nanos 'date +"%s%N"'
abbr yt 'yt-dlp --downloader aria2c'
abbr si 'stat -c %s'
abbr .. 'cd ..'
abbr ... 'cd .. && cd ..'
abbr .... 'cd .. && cd .. && cd ..'
abbr ..... 'cd .. && cd .. && cd .. && cd ..'

# short
abbr lsblk 'l'
abbr gu 'gitui'
abbr m 'micro'
abbr ra 'ranger'
abbr p 'python3'
abbr ju 'julia'

# long?
abbr listblock 'lsblk'
abbr list 'ls'
abbr concatenate 'cat'

# options
abbr base64 'base64 -w0' 
abbr du 'du -h'
abbr grep 'grep'
abbr cp 'cp -iv'
abbr cat 'bat -pp'
abbr ls 'ls --group-directories-first -ltrGh'

# apt
abbr i 'yay -S --noconfirm'
abbr r 'yay -R'
abbr u 'yay -Syu'

# i3 
abbr abbreviations 'micro ~/.config/fish/abbreviations.fish'
abbr config 'micro ~/.config/i3/config'
abbr config2 'micro ~/.config/i3status/config'

# ollama
abbr ai 'ollama run llama2:13b --nowordwrap'
abbr ai2 'ollama run tinyllama:1.1b --nowordwrap'
abbr aimini 'ollama run qwen:0.5b --nowordwrap'

# navigation
abbr cdM 'cd ~/media'
abbr cdC 'cd ~/media/code/Configs'
abbr cdc 'cd ~/.config/fish/'
abbr cdP 'cd ~/media/code/Projects'
abbr cds 'cd ~/media/code/scripts'
abbr cdr 'cd ~/media/code/rofi'
abbr cdp 'cd ~/media/random/Pics'
abbr cdv 'cd ~/media/random/Vids'
abbr cdR 'cd ~/media/random'
