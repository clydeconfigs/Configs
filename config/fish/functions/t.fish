function t
    if test "$argv[1]" = "c"
            if test -e /tmp/t
                set size (du -h /tmp/t | awk '{print $1}' | tail -n1)
                rm -rf /tmp/t
                echo "deleted $size of files inside /tmp/t"
            else
                echo "/tmp/t doesn't exist"
            end
    else 
        begin
            test -e "/tmp/t" || mkdir "/tmp/t"; chmod 777 "/tmp/t"
            if test (count $argv) -lt 1
                set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
                set temp_dir "$random_chars"
                echo "created $temp_dir without a name"
            else
                set random_chars (tr -dc "a-z" </dev/urandom | head -c 10)
                set temp_dir "$argv[1]_$random_chars"
            end
            mkdir "/tmp/t/$temp_dir"; chmod 700 "/tmp/t/$temp_dir"; cd "/tmp/t/$temp_dir"
        end
    end
end
