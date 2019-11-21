#!/bin/bash

# ----------------------- #
# scripts/debain/setup.sh #
# ----------------------- #

# Bash script for installing and setting up a fresh debain/ubuntu box.
# NOTE: This script must be run as sudo

# TODO: Ensure we are running as sudo

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
printf "\n ---- ${GREEN}ubuntu/setup.sh${NC} ---- \n"
printf "\n ${BACKGROUND_BLUE} Ubuntu Setup and Install Script ${NC} \n"
# printf "\n ${CYAN}Checking Requirements...${NC}\n\n"

#################
# BEGIN INSTALL #
#################

# printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"
# printf "\n  ${BACKGROUND_GREEN} Installing Git Integration and Utility Modules: ${NC}\n\n"

# printf "\n  ${BACKGROUND_GREEN} Installing Git and Hub Integration: ${NC}\n\n"

# sudo apt install git
# sudo snap install hub --classic

# TODO: Create ../git/setup.sh

# TODO: Print git and hub versions

# ---------------------------------------------------------------------------------- #

printf "\n  ${BACKGROUND_GREEN} Installing Curl: ${NC}\n\n"

# sudo apt install curl

# TODO: Print curl version

# ---------------------------------------------------------------------------------- #

# printf "\n  ${BACKGROUND_GREEN} Installing NodeJS Utility Modules: ${NC}\n\n"
printf "\n  ${BACKGROUND_GREEN} Installing NodeJS Version Manager (NVM): ${NC}\n\n"

# https://github.com/nvm-sh/nvm
# RUN:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# TODO: Install latest node and npm

# ---------------------------------------------------------------------------------- #

# printf "\n  ${BACKGROUND_GREEN} Installing Development Utility Modules: ${NC}\n\n"

# vscode, emacs, neovim

# printf "\n  ${BACKGROUND_GREEN} Installing System Utility Modules: ${NC}\n\n"

# printf "\n ${LIGHT_GREEN} Finished Installing Packages!${NC}\n"
# printf "\n  ${BACKGROUND_GREEN} Listing Package Versions: ${NC}\n\n"

printf "\n ---- ${BACKGROUND_GREEN} DONE! ${NC} ---- \n\n"

# EOF #
