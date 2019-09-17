
#source ~/git-flow-completion.bash
#source ~/git-prompt.sh

#PROMPT_COMMAND='__posh_git_ps1 "\[\033[01;32m\]\h \[\033[00m\]: \[\033[01;34m\]\w \[\033[00m\]: " "\n \[\033[00m\]$ ";'$PROMPT_COMMAND

eval "$(hub alias -s bash)"

alias git='hub'
alias gs='git status'

alias ls='lsd -a1'
