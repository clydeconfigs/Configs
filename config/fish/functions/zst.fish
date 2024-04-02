function zst
    if test (count $argv) -eq 2
        set -x ZSTD_CLEVEL $argv[2]
    else
        set -x ZSTD_CLEVEL 19
    end

    if string match -q "*/" "$argv[1]"
        set -x argv[1] (string split "" $argv[1] | head -n -1 | string join "")
    end

    tar --zstd -cvf "$argv[1].tar.zst" "$argv[1]"
end
