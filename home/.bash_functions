#
# ~/.bash_functions
#

# mini functions
cc() { gcc -o $1 $2 ; }
dif() { diff -u $1 $2 | diff-so-fancy | grep -vE "renamed: |────" ; }
diary() { sh $HOME/Media/Random/Diary/open.sh ; }
notepad() { micro $HOME/Media/Random/notepad.txt ; }
mouse() { xinput set-prop "SINOWEALTH GXT 970 Gaming Mouse" "libinput Accel Speed" -0.5 ; }

# sync hdd
synclocal() { lsblk; read -p "Do you want to continue? (y/n): " && [[ -z "$REPLY" ]] || [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program..."; sh ~/Media/Code/shell/sync/copy_and_sync_local_hdd.sh ; }
syncexternal() { lsblk; read -p "Do you want to continue? (y/n): " && [[ -z "$REPLY" ]] || [[ "$REPLY" =~ ^[Yy](es)?$ ]] || { echo "Exiting the program."; exit 0; } && echo "Continuing with the program..."; sh ~/Media/Code/shell/sync/sync_external_hdd.sh || sh ~/Media/Code/shell/sync/sync_external_hdd2.sh; }
copyconfigs() { sh $HOME/Media/Code/shell/sync/copy_configs.sh ; }

#
# bloated functions below... careful!
#

function t() {
	if [ $# -lt 1 ]; then
	  random_chars=$(tr -dc "a-z" </dev/urandom | head -c 10)
	  temp_dir="/tmp/t/$random_chars"
	  echo "Created $temp_dir without a name. Remember, to create with a name use: t <directory_name>"
	  mkdir -p "$temp_dir" && cd "$temp_dir"
	  return 1
	elif [ "$1" == "c" ]; then
	  rm -rf /tmp/t/*
	  echo "Deleted all files inside /tmp/t"
	else
	  random_chars=$(tr -dc "a-z" </dev/urandom | head -c 10)
	  temp_dir="/tmp/t/$1_$random_chars"
	  mkdir -p "$temp_dir" && cd "$temp_dir"
	fi
}

function ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

function g() {
  if [ "$#" -eq 0 ]; then
    cd "$(dirname "$(fzf)")"
  elif [ "$1" == "c" ]; then
   	echo -n \"$(fzf)\" | xclip -sel clipboard
  elif [ "$1" == "mpv" ]; then
   	mpv "$(fzf)"
  fi
}
