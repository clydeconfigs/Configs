function enc
    scrypt enc --logN 21 -r8 -p1 $argv[1] $argv[1].scrypt
end
