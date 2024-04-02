function ct
    if test (count $argv) -lt 1
        echo "input the name or content of the name of the /tmp/t/ folder you want to cd into"
        exit 1
    else
        cd /tmp/t/(ls /tmp/t | grep $argv[1])
    end
end
