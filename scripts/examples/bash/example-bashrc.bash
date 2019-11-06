#!/bin/bash

##################
# bashrc - Basic #
##################

# This file is essentially designed so you can just copy and paste to
# your ~/.bashrc file.

# Find out what is taking so much space on your drives
alias diskspace="du -S | sort -n -r | less"

# Easy way to extract archives
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1     ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# Add color in manpages for less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Move 'up' so many directories instead of using several cd ../../, etc.
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

#Another variation of the one above
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."


# Common variations of 'ls' command
alias ll="ls -l"
alias lo="ls -o"
alias lh="ls -lh"
alias la="ls -la"
alias sl="ls"
alias l="ls"
alias s="ls"

#List people in a Twitch channel chat
function twitch_list() { curl -s "https://tmi.twitch.tv/group/user/$1/chatters" | less; }

#Nano for writing and spell-checking
function spellcheck() { aspell -c "$1"; }
function spell() { echo "$1" | aspell -a; }
alias nano="nano -m -u -c -W --tabsize=4 --autoindent"
alias writer="nano -m -u -c -W -l --tabsize=4 --fill=85 --autoindent --smooth"

# Print a word from a certain column of the output when piping.
# Example: cat /path/to/file.txt | fawk 2 --> Print every 2nd word in each line.
function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}

#Tail all logs in /var/log
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# Colors for All grep commands such as grep, egrep and zgrep
export GREP_OPTIONS='--color=auto'

# Git related
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'
alias gb='git branch'
alias gl='git log'
alias gsb='git show-branch'
alias gco='git checkout'
alias gg='git grep'
alias gk='gitk --all'
alias gr='git rebase'
alias gri='git rebase --interactive'
alias gcp='git cherry-pick'
alias grm='git rm'

# 'cd' to the most recently modified directory in $PWD
cl()
{
        last_dir="$(ls -Frt | grep '/$' | tail -n1)"
        if [ -d "$last_dir" ]; then
                cd "$last_dir"
        fi
}

# Directory bookmarking (one at a time)
rd(){
    pwd > "$HOME/.lastdir_$1"
}

crd(){
        lastdir="$(cat "$HOME/.lastdir_$1")">/dev/null 2>&1
        if [ -d "$lastdir" ]; then
                cd "$lastdir"
        else
                echo "no existing directory stored in buffer $1">&2
        fi
}

# 'cd' into a directory and then list contents
cdls() { cd "$1"; ls;}

#For when you've spent too much time in DOS
alias cls="clear"
alias dir="ls"
alias deltree="rm -r"
alias rmdir="rm -r"
alias rd="rm -r"
alias rename="mv"
alias cd..="cd .."
alias chdir="pwd"
alias cmd="bash"
alias edit="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
alias erase="rm"
alias del="rm"
alias delete="rm"
alias expand="extract"
diskcopy(){ dd if=$1 of=$2; }
alias tasklist="htop"
alias tracert="traceroute"

#Generate a random strong password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

#List by file size in current directory
sbs() { du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}

#Show active ports
alias port='netstat -tulanp'

#Kill any lingering SSH processes
function sshkill() { ps aux | grep ssh | grep -v grep | grep -v sshd | awk {'print $2'} | xargs -r kill -9; }

#Rough function to display the number of unread emails in your gmail: gmail [user name]
gmail() { curl -u "$1" --silent "https://mail.google.com/mail/feed/atom" | sed -e 's/<\/fullcount.*/\n/' | sed -e 's/.*fullcount>//'; }

#Use these for when the boss comes around to look busy.
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"
function busytext() { while true; do sleep .15; head /dev/urandom | tr -dc A-Za-z0-9; done; }

#Print last value returned from previous command
lastvalue='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'

#Translator; requires Internet
#Usage: translate <phrase> <output-language>
#Example: translate "Bonjour! Ca va?" en
#See this for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
function translate(){ wget -U "Mozilla/5.0" -qO - "http://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$2&dt=t&q=$(echo $1 | sed "s/[\"'<>]//g")" | sed "s/,,,0]],,.*//g" | awk -F'"' '{print $2, $6}'; }

#Task List
TASKFILE="$HOME/.bashtask" #Hidden for neatness
NC='\033[0m' # No Color
LIGHTRED='\e[1;31m'
LIGHTBLUE='\e[1;34m'
if [ -f "$TASKFILE" ] && [ $(stat -c %s "$TASKFILE") != 0 ] #Check if file has content
then
    echo -e "${LIGHTRED}Task List${NC} as of ${LIGHTBLUE}$(date -r "$TASKFILE")${NC}"
    echo ""
    cat "$TASKFILE"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
else
    echo "Yay! No tasks :)"
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' "-"
    touch "$TASKFILE"
fi
alias tasklist="bash"
function taskadd() { echo "- $1" >> "$TASKFILE"; } #Example: taskadd "Go grocery shopping"
function taskin() { sed -i "$1i- $2" "$TASKFILE"; } #Insert a task between items
function taskrm() { sed -i "$1d" "$TASKFILE"; } #Example: taskrm 2 --> Removes second item in list
function taskcl() { rm "$TASKFILE"; touch "$TASKFILE"; } #Delete and create a new taskfile

#Converting audio and video files
function 2ogg() { eyeD3 --remove-all-images "$1"; fname="${1%.*}"; sox "$1" "$fname.ogg"; rm "$1"; }
function 2wav() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.ogg" && rm "$1"; }
function 2doswav() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" -ar 11025 -acodec pcm_u8 -ac 1 "$fname'_converted'.wav" && rm "$1"; }
function 2aif() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.aif" && rm "$1"; }
function 2mp3() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mp3" && rm "$1"; }
function 2mov() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mov" && rm "$1"; }
function 2mp4() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mp4" && rm "$1"; }
function 2avi() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.avi" && rm "$1"; }
function 2webm() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" -c:v libvpx "$fname.webm" && rm "$1"; }
function 2h265() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" -c:v libx265 "$fname'_converted'.mp4" && rm "$1"; }
function 2flv() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.flv" && rm "$1"; }
function 2mpg() { fname="${1%.*}"; ffmpeg -threads 0 -i "$1" "$fname.mpg" && rm "$1"; }

#Converting documents and images
function 2txt() { soffice --headless --convert-to txt "$1"; }
function 2pdf() {
    if [ ${1: -4} == ".html" ]
    then
        fname="${1%.*}"
        soffice --headless --convert-to odt "$1"
        soffice --headless pdf "$fname.html"
    else
        soffice --headless --convert-to pdf "$1"
    fi
}
function 2doc() { soffice --headless --convert-to doc "$1"; }
function 2odt() { soffice --headless --convert-to odt "$1"; }
function 2pcx() { fname="${1%.*}"; convert "$1" -colors 256 "$fname.pcx" && rm "$1"; }
function 2jpeg() { fname="${1%.*}"; convert "$1" "$fname.jpg" && rm "$1"; }
function 2jpg() { fname="${1%.*}"; convert "$1" "$fname.jpg" && rm "$1"; }
function 2png() { fname="${1%.*}"; convert "$1" "$fname.png" && rm "$1"; }
function 2bmp() { fname="${1%.*}"; convert "$1" "$fname.bmp" && rm "$1"; }
function 2dosbmp() { fname="${1%.*}"; convert "$1" -colors 16 -depth 4 BMP3:"$fname'_converted'.bmp" && rm "$1"; }
function 2dosgif() { fname="${1%.*}"; convert "$1" -colors 256 -dither none -resize 320x200\! GIF87:"$fname'_converted'.gif" && rm "$1"; }
function 2tiff() { fname="${1%.*}"; convert "$1" "$fname.tiff" && rm "$1"; }
function 2gif() {
    fname="${1%.*}"
    if [ ! -d "/tmp/gif" ]; then mkdir "/tmp/gif"; fi
    if [ ${1: -4} == ".mp4" ] || [ ${1: -4} == ".mov" ] || [ ${1: -4} == ".avi" ] || [ ${1: -4} == ".flv" ] || [ ${1: -4} == ".mpg" ] || [ ${1: -4} == ".webm" ]
    then
        ffmpeg -i "$1" -r 10 -vf 'scale=trunc(oh*a/2)*2:480' /tmp/gif/out%04d.png
        convert -delay 1x10 "/tmp/gif/*.png" -fuzz 2% +dither -coalesce -layers OptimizeTransparency +map "$fname.gif"
    else
        convert "$1" "$fname.gif"
        rm "$1"
    fi
    rm -r "/tmp/gif"
}
function 2ico() { fname="${1%.*}"; convert -background transparent "$1" -define icon:auto-resize=16,32,48,64,128 "$fname.ico" && rm "$1"; }

#Tonvid is a YouTube frontend and this helps for when copy/paste text isn't possible
function tonvid() { mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa --ytdl-format="[ext=mp4][height<=?720]" http://tonvid.com/info.php?video_id=$1; }

#Grab a pretty ascii forecast picture for anywhere
#Example: weather New York, NY
function weather() { curl -s http://wttr.in/$2; }

#Grab weather information from USAirNet and have a pretty Wttr.in ascii output
#Example: weather 02118 boston
function weatherus() { echo ""; w3m http://www.usairnet.com/weather/forecast/local/?pands=$1 | grep -A 10 "${2^^}"; echo ""; curl -s http://wttr.in/$2; }

#Convert hex data file to a binary
hex2bin () { s=${@^^}; for i in $(seq 0 1 $((${#s}-1))); do printf "%04s" `printf "ibase=16; obase=2; ${s:$i:1};\n" | bc` ; done; printf "\n"; }

#Create a randomized playlist for audio and video recursively
alias playlist="find -D tree . | sort -R --random-source=/dev/urandom > playlist.m3u"

#Play Twitch streams with MPV in GUI or TTY
#Use as: twitch username
function twitch() { mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa,jack --ytdl-format="best[ext=mp4][height<=?720]" https://twitch.tv/$1; }

#Play just about anything web related that youtube-dl supports
function webplay() { ffplay -vf scale=720x480 "$(youtube-dl -g $1)"; }
function webplayer() { ffplay -vf scale=720x480 "$(youtube-dl -g $1)"; }

#Optimize mpv for playing just about anything in any environment
alias mpv="mpv --vo=opengl,x11,drm,tct,caca --ao=pulse,alsa,jack --user-agent='Mozilla' --ytdl-format='best[ext=mp4][height<=?720]'"

#Play last viewed, or attempted to view video using mpv
function mpvkodi() { URL="$(grep 'mp4' ~/.kodi/temp/kodi.log | awk '{print $6}' | cut -d '|' -f1 | tail -n 1)"; mpv "$URL"; }

#If playback on Kodi is slow, download last viewed, or attempted to view video using axel
function axelkodi() { URL="$(grep 'mp4' ~/.kodi/temp/kodi.log | awk '{print $6}' | cut -d '|' -f1 | tail -n 1)"; axel -n 10 "$URL"; }

#Humor
alias zardoz='sudo'

#Use curl and "https://cht.sh/" to quickly search how to do things
#Examples: 'howin html do I view an image'
#          'howin python do I add numbers'
howin() {
where="$1"; shift
IFS=+ curl "https://cht.sh/$where/$*"
}

#Create lists from multi-line output
function list() { awk 'BEGIN { ORS="" } { print p"'"'"'"$0"'"'"'"; p=", " } END { print "\n" }' ; }

