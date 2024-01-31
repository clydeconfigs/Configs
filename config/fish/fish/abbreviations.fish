# abbreviations
abbr -ag upper 'tr [:lower:] [:upper:]'
abbr -ag lower 'tr [:upper:] [:lower:]'
abbr -ag tb 'nc termbin.com 9999'
abbr -ag bs 'echo \\ Ctrl+U 005C; echo -n "\\" | xclip -selection clipboard'
abbr -ag disks 'watch -n 0.1 lsblk'
abbr -ag nano 'date +"%s%N"'
abbr -ag ai 'ollama run mistral'
abbr -ag yt 'yt-dlp --downloader aria2c'
abbr -ag si 'stat -c %s'
abbr -ag .. 'cd ..'
abbr -ag ... 'cd .. && cd ..'

abbr -ag m 'micro'
abbr -ag e 'emacs -nw'
abbr -ag ra 'ranger'
abbr -ag p 'python3'
abbr -ag l 'lua5.4'
abbr -ag j 'julia'

abbr -ag du 'du -h'
abbr -ag ls 'ls --color=auto'
abbr -ag grep 'grep --color=auto'
abbr -ag cp 'cp -iv'
abbr -ag cat 'bat -pp'

# apt
abbr -ag i 'yay -S --noconfirm'
abbr -ag r 'yay -R'
abbr -ag u 'yay -Syu'
abbr -ag s 'yay'

# i3 
abbr -ag config 'micro ~/.config/i3/config'
abbr -ag config2 'micro ~/.config/i3status/config'
