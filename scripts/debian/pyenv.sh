#!/bin/bash

# ----------------------- #
# scripts/debian/pyenv.sh #
# ----------------------- #

# Bash script for installing pyenv.
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

printf "\n ---- ${GREEN}debain/pyenv.sh${NC} ---- \n"
printf "\n ${BACKGROUND_BLUE} Pyenv Install Script ${NC} \n"

# printf "\n ${CYAN}Checking Requirements...${NC}\n\n"
# printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"

###############
# BEGIN SETUP #
###############

# https://github.com/pyenv/pyenv/wiki/Common-build-problems

# printf "\n ${BACKGROUND_BLUE} Running Initial Setup Steps: ${NC} \n"

# Requires:
# gcc
# make
# zlib1g-dev

#################
# BEGIN INSTALL #
#################

printf "\n ${BACKGROUND_BLUE} Running Pyenv Install Steps: ${NC} \n"

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

printf "\n ${LIGHT_GREEN} Pyenv Install Complete! ${NC}\n"

# ---------------------------------------------------------------------------------- #

# printf "\n  ${BACKGROUND_GREEN} Listing Package Versions: ${NC}\n\n"

# Print install versions
# pyenv --version
# python -V
# pip -V

printf "\n ---- ${BACKGROUND_GREEN} DONE! ${NC} ---- \n\n"

# EOF #
