
##################
# .bashrc config #
##################

# ~/.bashrc file.

# Move 'up' so many directories instead of using several cd ../../, etc.
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

##########
# Alias' #
##########

#Another variation of the one above
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Common variations of 'ls' command
# alias ll="ls -l"
# alias lo="ls -o"
# alias lh="ls -lh"
# alias la="ls -la"
# alias sl="ls"
# alias l="ls"
# alias s="ls"

# alias ls='lsd -a1'

###############
# Git related #
###############

# Use GitHubs' cli in favor of git
eval "$(hub alias -s bash)"
alias git='hub'

alias gs='git status'
alias gc='git commit'
alias ga='git add'

# alias gd='git diff'
# alias gb='git branch'
# alias gl='git log'
# alias gsb='git show-branch'
# alias gco='git checkout'
# alias gg='git grep'
# alias gk='gitk --all'
# alias gr='git rebase'
# alias gri='git rebase --interactive'
# alias gcp='git cherry-pick'
# alias grm='git rm'

###############
# DOS related #
###############

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

#Generate a random strong password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

#Show active ports
alias port='netstat -tulanp'

# Grab a pretty ascii forecast picture for anywhere
# Example: weather New York, NY
function weather() { curl -s http://wttr.in/$2; }


# EOF #
