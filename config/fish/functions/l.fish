function l
    lsblk && \
    echo && \
    df -h -x tmpfs -x efivarfs | sed '2d'
end