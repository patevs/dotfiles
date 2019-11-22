#!/bin/bash

# ----------------------- #
# scripts/debian/setup.sh #
# ----------------------- #

# Bash script setting up a fresh debian/ubuntu installation.
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

# TODO: Ensure commands run without prompting for user confirmation

printf "\n  ${BACKGROUND_GREEN} Updating Package Repositories: ${NC}\n\n"
# sudo apt update

printf "\n  ${BACKGROUND_GREEN} Upgrading Installed Packages: ${NC}\n\n"
# sudo apt upgrade

printf "\n  ${BACKGROUND_GREEN} Removing Old Packages: ${NC}\n\n"
# sudo apt autoremove

printf "\n ${LIGHT_GREEN} Initial Setup Steps Complete! ${NC}\n"

#################
# BEGIN INSTALL #
#################

printf "\n ${BACKGROUND_BLUE} Running Package Install Steps: ${NC} \n"

printf "\n  ${BACKGROUND_GREEN} Installing Git and GitHub Integration Packages: ${NC}\n\n"

# sudo apt --assume-yes install git
# sudo snap install hub --classic

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

printf "\n  ${BACKGROUND_GREEN} Installing NodeJS Version Manager (NVM) Package, Latest LTS NodeJS, and Latest NPM: ${NC}\n\n"

# https://github.com/nvm-sh/nvm

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

# Install latest node and npm
# nvm install --lts --latest-npm

# TODO: Install global npm utilities from ../npm/install.sh
# bash ../npm/install.sh

# TODO: Print NVM, NodeJS, and NPM versions
# nvm --version
# node --version
# npm --version

printf "\n ${LIGHT_GREEN} NVM | NodeJS | NPM Install Complete! ${NC}\n"

# ---------------------------------------------------------------------------------- #

# pyenv , python , pip

# https://github.com/pyenv/pyenv
# https://github.com/pyenv/pyenv-installer

# Install pyenv

# curl https://pyenv.run | bash

# Equivilent to: 
# curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash

# Enable pyenv by adding the following to ~/.bashrc
# export PATH="/home/pat/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# Restart shell
# exec $SHELL

# Install pyenv requirements

# c compiler
# sudo apt --assume-yes install gcc
# GNU readline
# sudo apt --assume-yes install libreadline-dev
# openssl < 1.1 requires:
# sudo apt install libcurl3
# sudo apt install libcurl-openssl1.0-dev
# bzip2
# install: libbz2-dev
# OR install: lbzip2

# Check pyenv installation
# pyenv doctor

# Install python
# pyenv install 3.7.5
# pyenv global 3.7.5

# Upgrade pip
# python -m pip install --upgrade pip

# Print package versions
# pyenv --version
# python -V
# pip -V

# ---------------------------------------------------------------------------------- #

# rbenv , ruby , gem , bundler , rails

# https://github.com/rbenv/rbenv
# https://github.com/rbenv/rbenv-installer
# https://github.com/rbenv/ruby-build

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
