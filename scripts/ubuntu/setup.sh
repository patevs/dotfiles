#!/bin/bash

# ----------------------- #
# scripts/ubuntu/setup.sh #
# ----------------------- #

# Bash script for installing and setting up a fresh ubuntu box.

# !NOTE: Must be run as sudo
# TODO: Check we are running as sudo

###################
# COLOR CONSTANTS #
###################

RED='\033[0;31m'
GREEN='\033[0;32m'
# BROWN='\033[0;33m'
# BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'

LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

BACKGROUND_GREEN='\033[42m'
BACKGROUND_BLUE='\033[44m'
BACKGROUND_PURPLE='\033[45m'
# BOLD='\033[1m'

# clear
# printf "\n ---- ${GREEN}npm/install.sh${NC} ---- \n"
# printf "\n ${BACKGROUND_BLUE} NPM Global Modules Install Script ${NC} \n"
# printf "\n ${CYAN}Checking Requirements...${NC}\n\n"

#################
# BEGIN INSTALL #
#################

# printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"
# printf "\n  ${BACKGROUND_GREEN} Installing Git Integration and Utility Modules: ${NC}\n\n"

# git...

# printf "\n  ${BACKGROUND_GREEN} Installing NodeJS Utility Modules: ${NC}\n\n"

# nvm, node, npm

# printf "\n  ${BACKGROUND_GREEN} Installing Development Utility Modules: ${NC}\n\n"

# vscode, emacs, neovim

# printf "\n  ${BACKGROUND_GREEN} Installing System Utility Modules: ${NC}\n\n"

# printf "\n ${LIGHT_GREEN} Finished Installing NPM Global Modules!${NC}\n"
# printf "\n  ${BACKGROUND_GREEN} Listing NPM Global Installs: ${NC}\n\n"

printf "\n ---- ${BACKGROUND_GREEN} DONE! ${NC} ---- \n\n"

# EOF #
