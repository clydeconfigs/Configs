function ctemplate
    test -z "$argv[1]" && set argv[1] main
    echo "#include <stdio.h>

int main(int argc, char **argv) {
    
}" >> "$argv[1]".c
end
