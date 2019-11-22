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

# RED='\033[0;31m'
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

BACKGROUND_GREEN='\033[42m'
BACKGROUND_BLUE='\033[44m'
# BACKGROUND_PURPLE='\033[45m'
# BOLD='\033[1m'

# clear

printf "\n ---- ${GREEN}git/setup.sh${NC} ---- \n"
printf "\n ${BACKGROUND_BLUE} Git Global Configuration Setup Script ${NC} \n"

# printf "\n ${CYAN}Checking Requirements...${NC}\n\n"

# TODO: Check git is installed

# printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"

###############
# BEGIN SETUP #
###############

# ...

printf "\n ---- ${BACKGROUND_GREEN} DONE! ${NC} ---- \n\n"

# EOF #
