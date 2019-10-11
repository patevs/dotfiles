
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

###############
# Git related #
###############

# Use GitHubs' cli in favor of git
eval "$(hub alias -s bash)"
alias git='hub'

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

# alias gs='git status'
# alias ls='lsd -a1'


# EOF #
