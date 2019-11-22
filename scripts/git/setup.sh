#!/bin/bash

# -------------------- #
# scripts/git/setup.sh #
# -------------------- #

# Bash script to setup git global configuation.
# Requires Git and diff-so-fancy to be installed.
# diff-so-fancy requires Perl, Node.js, and NPM to be installed.

###################
# COLOR CONSTANTS #
###################

RED='\033[0;31m'
GREEN='\033[0;32m'
# BROWN='\033[0;33m'
# BLUE='\033[0;34m'
# PURPLE='\033[0;35m'
CYAN='\033[0;36m'

LIGHT_GREEN='\033[1;32m'
# LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

BACKGROUND_GREEN='\033[42m'
BACKGROUND_BLUE='\033[44m'
BACKGROUND_PURPLE='\033[45m'
# BOLD='\033[1m'

####################
# HELPER FUNCTIONS #
####################

# Setting a return status for a function
# print_something () {
#   echo Hello $1
#   return 5
# }
# print_something Mars
# print_something Jupiter
# echo The previous function has a return value of $?

install_diff_so_fancy () {
  printf "\n  ${BACKGROUND_GREEN} Installing diff-so-fancy... ${NC}\n"
  # TODO: Check Perl, NodeJS, and NPM are installed
}

# TODO: Create a helper function for checking commands exist

######################
# CHECK REQUIREMENTS #
######################

# clear

printf "\n ---- ${GREEN}git/setup.sh${NC} ---- \n"
printf "\n ${BACKGROUND_BLUE} Git Global Configuration Setup Script ${NC} \n"

printf "\n ${CYAN}Checking Requirements...${NC}\n"

# Check git is installed
if ! [ -x "$(command -v git)" ]; then
  # echo 'Error: git is not installed.' >&2
  printf "\n ${RED}Error:${NC} git is not installed.\n\n" # >&2
  exit 1
fi

# Print git version
printf "\n ${BACKGROUND_PURPLE} Git installation: ${NC}\n\n"
git --version

# Check diff-so-fancy is installed
if ! [ -x "$(command -v diff-so-fancy)" ]; then
  printf "\n ${RED}Error:${NC} diff-so-fancy is not installed.\n\n" # >&2
  install_diff_so_fancy
fi

printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Setting Git Global Configuration...${NC}\n"

###############
# BEGIN SETUP #
###############

# Set Username and email
printf "\n  ${BACKGROUND_GREEN} Setting Username and Email ${NC}\n"

git config --global user.email "ppevans11@gmail.com"
git config --global user.name "PatEvs"
git config --global github.user "PatEvs"

# Set git-diff ui colors and configuration
# printf "\n  ${BACKGROUND_GREEN} Setting git-diff UI Color and Configuration: ${NC}\n\n"

# git config --global color.ui true
# git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
# git config --global color.diff-highlight.oldNormal    "red bold"
# git config --global color.diff-highlight.oldHighlight "red bold 52"
# git config --global color.diff-highlight.newNormal    "green bold"
# git config --global color.diff-highlight.newHighlight "green bold 22"
# git config --global color.diff.meta       "11"
# git config --global color.diff.frag       "magenta bold"
# git config --global color.diff.commit     "yellow bold"
# git config --global color.diff.old        "red bold"
# git config --global color.diff.new        "green bold"
# git config --global color.diff.whitespace "red reverse"

# Print git global configuration
printf "\n ${LIGHT_GREEN} Git Global Configuration: ${NC}\n\n"

git config --global --list

printf "\n ---- ${BACKGROUND_GREEN} DONE! ${NC} ---- \n\n"

# EOF #
