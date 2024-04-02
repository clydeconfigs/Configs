function junk
    cat /usr/share/dict/spanish | sed 's/\b.*\b/&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n&\n/' | shuf | tail -n $argv[1] | tr \n " "
end
