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

printf "\n ---- ${GREEN}debain/setup.sh${NC} ---- \n"
printf "\n ${BACKGROUND_BLUE} Debian/Ubuntu Initial Setup and Install Script ${NC} \n"

# printf "\n ${CYAN}Checking Requirements...${NC}\n\n"
# printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"

###############
# BEGIN SETUP #
###############

printf "\n ${BACKGROUND_BLUE} Running Initial Setup Steps: ${NC} \n"

printf "\n  ${BACKGROUND_GREEN} Updating Package Repositories: ${NC}\n\n"
# sudo apt update

printf "\n  ${BACKGROUND_GREEN} Upgrading Installed Packages: ${NC}\n\n"
# sudo apt upgrade

printf "\n ${LIGHT_GREEN} Initial Setup Steps Complete! ${NC}\n"

#################
# BEGIN INSTALL #
#################

printf "\n ${BACKGROUND_BLUE} Running Package Install Steps: ${NC} \n"

printf "\n  ${BACKGROUND_GREEN} Installing Git and GitHub Integration Packages: ${NC}\n\n"

# sudo apt install git
# sudo snap install hub --classic

# TODO: Install perl
# TODO: Create and run ../git/setup.sh

# Print Git and GitHub tool versions
# hub version

printf "\n ${LIGHT_GREEN} Git and GitHub Install Complete! ${NC}\n"

# ---------------------------------------------------------------------------------- #

printf "\n  ${BACKGROUND_GREEN} Installing Curl Package: ${NC}\n\n"

# sudo apt install curl

# Print curl version
# curl --version

printf "\n ${LIGHT_GREEN} Curl Install Complete! ${NC}\n"

# ---------------------------------------------------------------------------------- #

printf "\n  ${BACKGROUND_GREEN} Installing NodeJS Version Manager (NVM) Package and Lastest NodeJS/NPM: ${NC}\n\n"

# https://github.com/nvm-sh/nvm
# RUN:
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# TODO: Install latest node and npm
# TODO: Install global npm utilities
# TODO: Print NVM, NodeJS, and NPM versions

printf "\n ${LIGHT_GREEN} NVM | NodeJS | NPM Install Complete! ${NC}\n"

# ---------------------------------------------------------------------------------- #

# pyenv , python , pip

# ---------------------------------------------------------------------------------- #

# renv , ruby , gem , bundler , rails

# ---------------------------------------------------------------------------------- #

# rust , cargo

# ---------------------------------------------------------------------------------- #

# lsd , Hack-NF

# ---------------------------------------------------------------------------------- #

# printf "\n  ${BACKGROUND_GREEN} Installing Development Utility Modules: ${NC}\n\n"

# vscode
# vim , neovim
# emacs , spacemacs
# zsh , oh-my-zsh
# asdf

# printf "\n  ${BACKGROUND_GREEN} Installing System Utility Modules: ${NC}\n\n"

# ---------------------------------------------------------------------------------- #

printf "\n ${LIGHT_GREEN} Package Install Steps Complete! ${NC}\n"

# printf "\n  ${BACKGROUND_GREEN} Listing Package Versions: ${NC}\n\n"

printf "\n ---- ${BACKGROUND_GREEN} DONE! ${NC} ---- \n\n"

# EOF #
