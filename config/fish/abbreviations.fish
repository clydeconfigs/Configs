function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# quick access
abbr notepad 'micro $HOME/Media/Random/notepad.txt'
abbr diary 'sh $HOME/Media/Random/Diary/open.sh'

# abbreviations
abbr e 'exit'
abbr hexdump 'hexdump --canonical'
abbr sc 'sudo cryptsetup'
abbr feh 'feh -d  --scale-down'
abbr gpg 'gpg --pinentry-mode loopback'
abbr copy 'xclip -sel c'
abbr upper 'tr [:lower:] [:upper:]'
abbr lower 'tr [:upper:] [:lower:]'
abbr tb 'nc termbin.com 9999'
abbr disks 'watch -n 0.1 lsblk -o NAME,SIZE,FSTYPE,FSUSE%,MOUNTPOINT'
abbr nanos 'date +"%s%N"'
abbr yt 'yt-dlp --downloader aria2c'
abbr si 'stat -c %s'
abbr .. 'cd ..'
abbr ... 'cd .. && cd ..'
abbr .... 'cd .. && cd .. && cd ..'
abbr ..... 'cd .. && cd .. && cd .. && cd ..'

# short
abbr lsblk 'lsblk -o NAME,SIZE,FSTYPE,FSUSE%,MOUNTPOINT'
abbr l 'lsblk -o NAME,SIZE,FSTYPE,FSUSE%,MOUNTPOINT;echo;df -h -x tmpfs -x efivarfs | sed '2d''
abbr lb 'lsblk'
abbr gu 'gitui'
abbr m 'micro'
abbr ra 'ranger'
abbr p 'python3'
abbr ju 'julia'

# long?
abbr listblock 'lsblk'
abbr list 'ls'

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
abbr cdM 'cd ~/Media'
abbr cdC 'cd ~/Media/Code/Configs'
abbr cdP 'cd ~/Media/Code/Projects'
abbr cds 'cd ~/Media/Code/scripts'
abbr cdr 'cd ~/Media/Code/rofi'
abbr cdp 'cd ~/Media/Random/Pics'
abbr cdv 'cd ~/Media/Random/Vids'
abbr cdR 'cd ~/Media/Random'
