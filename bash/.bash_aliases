
# --------------- #
# ~/.bash_aliases #
# --------------- #

# TODO: Verify hub is installed
eval "$(hub alias -s bash)"

alias git='hub'
alias gs='git status'

# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# TODO: Move these to /.bash_aliases
# alias ls='lsd -a1'
# alias l='lsd -l'
# alias la='ls -a'
# alias la='lsd -la'
# alias lt='lsd --tree'

# alias ls='lsd -a1'

# 'cd' into a directory and then list contents
# TODO: Move this to ~/.bashrc or ~/.profile
# cdls() { cd "$1"; ls;}

# For when you've spent too much time in DOS
alias cls="clear"
alias dir="ls"
# alias deltree="rm -r"
# alias rmdir="rm -r"
# alias rd="rm -r"
# alias rename="mv"
# alias cd..="cd .."
# alias chdir="pwd"
# alias cmd="bash"
# alias edit="nano -m -u -c -W --tabsize=4 --fill=100 --autoindent"
# alias erase="rm"
# alias del="rm"
# alias delete="rm"
# alias expand="extract"
# diskcopy(){ dd if=$1 of=$2; }
# alias tasklist="htop"
# alias tracert="traceroute"

# Generate a random strong password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

# Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# EOF #
