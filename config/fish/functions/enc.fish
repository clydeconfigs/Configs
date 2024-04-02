function enc
    scrypt enc --passphrase dev:stdin-once --logN 20 -r8 -p8 $argv[1] $argv[1].sc
end
