function lst
    find . -maxdepth 1 -type f -exec sh -c 'echo -e "$(basename "{}")  $(file --mime-type -b "{}")"' \;
end
