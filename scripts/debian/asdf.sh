#!/bin/bash

# ---------------------- #
# scripts/debian/asdf.sh #
# ---------------------- #

# Bash script for installing asdf-vm CLI tool.

# Resources:
#   https://github.com/asdf-vm/asdf
#
#   Installation:
#       https://asdf-vm.com/#/core-manage-asdf-vm
#   Command List:
#       https://asdf-vm.com/#/core-commands
#   Plugin List
#       https://asdf-vm.com/#/plugins-all

###################
# COLOR CONSTANTS #
###################

RED='\033[0;31m'
GREEN='\033[0;32m'
# BROWN='\033[0;33m'
# BLUE='\033[0;34m'
# PURPLE='\033[0;35m'
# CYAN='\033[0;36m'

# LIGHT_GREEN='\033[1;32m'
# LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# BACKGROUND_GREEN='\033[42m'
BACKGROUND_BLUE='\033[44m'
# BACKGROUND_PURPLE='\033[45m'
# BOLD='\033[1m'

################
# START SCRIPT #
################

# clear

printf "\n ---- ${GREEN}debain/asdf.sh${NC} ---- \n"
printf "\n ${BACKGROUND_BLUE} asdf install script ${NC} \n"

####################
# HELPER FUNCTIONS #
####################

# Examples

# Setting a return status for a function
# print_something () {
#   echo Hello $1
#   return 5
# }
# print_something Mars
# print_something Jupiter
# echo The previous function has a return value of $?

# function_name () {
#    echo "Parameter #1 is $1"
# }
# function_name "$arg1" "$arg2"

# TODO: Create a helper function for checking commands exist

command_exists () {
    echo "arg: $1"
}

command_exists "git"

######################
# CHECK REQUIREMENTS #
######################

# printf "\n ${CYAN}Checking Requirements...${NC}\n\n"
# printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"

# Ensure git is installed
if ! [ -x "$(command -v git)" ]; then
  printf "\n ${RED}Error:${NC} git is not installed.\n\n" # >&2
  exit 1
fi

#################
# BEGIN INSTALL #
#################

# Clone the asdf repo and checkout the latest branch:

# git clone https://github.com/asdf-vm/asdf.git ~/.asdf
# cd ~/.asdf
# git checkout "$(git describe --abbrev=0 --tags)"

# EOF #
