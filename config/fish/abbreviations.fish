function last_history_item
    echo $history[1]
end
abbr -a !! --position anywhere --function last_history_item

# changing directories
function t; mkdir /tmp/t/ 2> /dev/null; set f (mktemp -d "/tmp/t/$argv[1]XXXXXXX"); cd $f; end
function ct; cd /tmp/t/(ls /tmp/t | grep $argv[1]); end
function cs; cd "$(echo $argv[1] | sed 's#\.#/#g')"; end
function cdf
    set path "$(fzf --preview 'cat {}')"
    if test -f $path
        cd "$(dirname $path)"
    else
        cd $path
    end    
end
function cdfr
    set path "$(fzf --preview 'cat {}')"
    if test -f $path
        ranger "$(dirname $path)"
    else
        ranger $path
    end    
end

# quick access
abbr notepad 'micro $HOME/media/Random/notepad.txt'
abbr diary 'sh $HOME/media/Random/Diary/open.sh'

# changes
abbr hexdump 'hexdump --canonical'
abbr feh 'feh -d  --scale-down'
abbr gpg 'gpg --pinentry-mode loopback'

# options
abbr base64 'base64 -w0' 
abbr du 'du -h'
abbr grep 'grep'
abbr cp 'cp -iv'
abbr cat 'bat -pp'
abbr ls 'ls --group-directories-first -ltGhS'

# short
abbr .. 'cd ..'
abbr ... 'cd .. && cd ..'
abbr .... 'cd .. && cd .. && cd ..'
abbr ..... 'cd .. && cd .. && cd .. && cd ..'
abbr si 'stat -c %s'
abbr sc 'sudo cryptsetup'
abbr e 'exit'
abbr gu 'gitui'
abbr m 'micro'
abbr ra 'ranger'
abbr p 'python3'

# apt
abbr i 'yay -S --noconfirm'
abbr r 'yay -R'
abbr u 'yay -Syu'

# ollama
abbr ai 'ollama run llama2:13b --nowordwrap'
abbr ai2 'ollama run tinyllama:1.1b --nowordwrap'
abbr aimini 'ollama run qwen:0.5b --nowordwrap'

# i3 
abbr abbreviations 'micro ~/.config/fish/abbreviations.fish'
abbr config 'micro ~/.config/i3/config'
abbr config2 'micro ~/.config/i3status/config'

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
