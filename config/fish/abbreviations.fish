# abbreviations
abbr -ag feh 'feh -d  --scale-down'
abbr -ag gpg 'gpg --pinentry-mode loopback'
abbr -ag copy 'xclip -sel c'
abbr -ag upper 'tr [:lower:] [:upper:]'
abbr -ag lower 'tr [:upper:] [:lower:]'
abbr -ag tb 'nc termbin.com 9999'
abbr -ag disks 'watch -n 0.1 lsblk'
abbr -ag nano 'date +"%s%N"'
abbr -ag yt 'yt-dlp --downloader aria2c'
abbr -ag si 'stat -c %s'
abbr -ag .. 'cd ..'
abbr -ag ... 'cd .. && cd ..'
abbr -ag .... 'cd .. && cd .. && cd ..'
abbr -ag ..... 'cd .. && cd .. && cd .. && cd ..'

# short
abbr -ag lb 'lsblk'
abbr -ag gu 'gitui'
abbr -ag m 'micro'
abbr -ag em 'emacs -nw'
abbr -ag ra 'ranger'
abbr -ag p 'python3'
abbr -ag ju 'julia'

# coreutils options
abbr -ag base64 'base64 -w0' 
abbr -ag du 'du -h'
abbr -ag ls 'ls --color=auto'
abbr -ag grep 'grep'
abbr -ag cp 'cp -iv'
abbr -ag cat 'bat -pp'

# apt
abbr -ag i 'yay -S --noconfirm'
abbr -ag r 'yay -R'
abbr -ag u 'yay -Syu'
abbr -ag s 'yay'

# i3 
abbr -ag abbreviations.fish 'micro ~/.config/fish/abbreviations.fish'
abbr -ag functions.fish 'micro ~/.config/fish/functions.fish'
abbr -ag config 'micro ~/.config/i3/config'
abbr -ag config2 'micro ~/.config/i3status/config'

# ollama
abbr -ag ai 'ollama run llama2:13b --nowordwrap'
abbr -ag ai2 'ollama run tinyllama:1.1b --nowordwrap'
abbr -ag aimini 'ollama run qwen:0.5b --nowordwrap'

# navigation
abbr -ag media 'cd ~/Media'
abbr -ag shell 'cd ~/Media/Code/shell'
abbr -ag rofi 'cd ~/Media/Code/rofi'
abbr -ag pics 'cd ~/Media/Random/Pics'
abbr -ag rando 'cd ~/Media/Random'
