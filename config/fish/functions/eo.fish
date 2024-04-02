function eo
    if test (count $argv) -eq 1
        set device $argv[1]
    
        set lol (basename $device)
    
        if not test -e /mnt/$lol
            sudo mkdir /mnt/$lol
        end
    
        if sudo cryptsetup luksOpen /dev/$device $lol; and sudo mount /dev/mapper/$lol /mnt/$lol
            echo "[eo] mounted at /mnt/$lol"
        else
            sudo mount /dev/$lol /mnt/$lol
            echo "[eo] mounted at /mnt/$lol"
        end
    end
end
