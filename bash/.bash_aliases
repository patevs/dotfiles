# --------------- #
# ~/.bash_aliases #
# --------------- #

# Helper Functions
# ================

# Generate a random strong password
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"

# Expand current directory structure in tree form
alias treed="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# Show active ports
alias port='netstat -tulanp'

# Grab a pretty ascii forecast picture for anywhere
# Example: weather New York, NY
function weather() { curl -s http://wttr.in/$2; }

# Check if a given command exists
function checkExistCommand()
{
    local -r command="${1}"
    local -r errorMessage="${2}"
    if [[ "$(existCommand "${command}")" = 'false' ]]
    then
        if [[ "$(isEmptyString "${errorMessage}")" = 'true' ]]
        then
            fatal "\nFATAL : command '${command}' not found"
        fi
        fatal "\nFATAL : ${errorMessage}"
    fi
}

function existCommand()
{
    local -r command="${1}"
    if [[ "$(which "${command}" 2> '/dev/null')" = '' ]]
    then
        echo 'false' && return 1
    fi
    echo 'true' && return 0
}

function isEmptyString()
{
    local -r string="${1}"
    if [[ "$(trimString "${string}")" = '' ]]
    then
        echo 'true' && return 0
    fi
    echo 'false' && return 1
}

function trimString()
{
    local -r string="${1}"
    sed 's,^[[:blank:]]*,,' <<< "${string}" | sed 's,[[:blank:]]*$,,'
}

# ------------------------------------------------------------------------------------------------------- #

# System Related Aliases
# ======================

# Move to desktop directory
alias desk="cd ~/Desktop"

# Move to code directory
# TODO: Ensure this directory exists
alias dev="cd ~/code"

# ? move this to ~/.bashrc or ~/.profile
# 'cd' into a directory and then list contents
# cdls() { cd "$1"; ls;}

# Move 'up' so many directories instead of using several cd ../../, etc.
# up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

# Another variation of the above function
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Favour lsd over ls when installed
# if [[ "$(existCommand 'lsd')" ]]
# then
#     alias ls='lsd -A1'
#     alias sl='lsd -A1'
#     alias l="lsd -A1"
#     alias s="lsd -A1"
#     alias ll='lsd -l'
#     alias lll='lsd -al'
#     alias la='lsd -la'
#     alias lt='lsd --tree'
# else
    # Common variations of 'ls' command
#     alias ls="ls -la"
#     alias sl="ls"
    # alias l='ls -CF'
#     alias l="ls"
#     alias s="ls"
#     alias ll="ls -l"
#     alias lll='ls -alF'
#     alias la='ls -A'
#     alias la="ls -la"
    # alias lo="ls -o"
    # alias lh="ls -lh"
# fi

# ------------------------------------------------------------------------------------------------------- #

# DOS Like Aliases
# ================

alias cls="clear"
alias dir="ls"

# ------------------------------------------------------------------------------------------------------- #

# Git & GitHub Aliases
# ====================

# Use GitHubs' cli in favor of git
# if [[ "$(existCommand hub)" ]]
# then
#   eval "$(hub alias -s bash)"
#   alias git='hub'
# fi

# Common git aliases
# if [[ "$(existCommand git)" ]]
# then
    # alias gs='git status'
    # alias gc='git commit'
    # alias ga='git add'
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
# fi

# ------------------------------------------------------------------------------------------------------- #

# NodeJS & NPM Aliases
# ====================

# NPM aliases
if [[ "$(existCommand npm)" ]]
then
    alias npl='npm list --depth=0'
    alias nplg='npm list --global --depth=0'
fi

# EOF #
