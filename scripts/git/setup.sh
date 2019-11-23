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

################
# START SCRIPT #
################

# clear
printf "\n ${BACKGROUND_GREEN} Git Global Configuration Setup Script ${NC} \n"

####################
# HELPER FUNCTIONS #
####################

# Helper function used for checking a given command exist
# https://stackoverflow.com/questions/5431909/returning-a-boolean-from-a-bash-function/5431932
command_exists () {
    # Check command exists
    if ! [ -x "$(command -v $1)" ]; then
        # exit 1
        false
        return
    else
      true
      return
    fi
}

# Helper function for installing diff-so-fancy
install_diff_so_fancy () {
  printf "\n  ${BACKGROUND_GREEN} Installing diff-so-fancy... ${NC}\n"
  # Check Perl, NodeJS, and NPM are installed
  if ! command_exists "perl"; then
    printf "\n ${RED}Error:${NC} Perl is not installed.\n\n" 
    exit 1
  fi
  if ! command_exists "node"; then
    printf "\n ${RED}Error:${NC} NodeJS is not installed.\n\n" 
    exit 1
  fi
  if ! command_exists "npm"; then
    printf "\n ${RED}Error:${NC} NPM is not installed.\n\n" 
    exit 1
  fi
  # Install diff-so-fancy
  npm install --global diff-so-fancy
}

######################
# CHECK REQUIREMENTS #
######################

printf "\n ${CYAN}Checking System Requirements...${NC}\n"

# Check git is installed
if command_exists "git"; then
  printf "\n ${BACKGROUND_PURPLE} Git installation: ${NC}\n\n"
  git --version
else
  printf "\n ${RED}Error:${NC} Git is not installed.\n\n" # >&2
  exit 1
  # TODO: Install git
fi

# Check diff-so-fancy is installed
if command_exists "diff-so-fancy"; then
  printf "\n ${BACKGROUND_PURPLE} diff-so-fancy installation: ${NC}\n\n"
  diff-so-fancy --version
else
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

printf "\n ${BACKGROUND_GREEN} DONE! ${NC} \n\n"

# EOF #
