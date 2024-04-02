function upload
    if test (count $argv) -lt 1
        curl -F 'file=@-' 0x0.st | sed 's/http/https/g' | xclip -sel c
    else
        curl -F 'file=@-' 0x0.st < $argv[1] | sed 's/http/https/g' | xclip -sel c
    end
end
