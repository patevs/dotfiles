#!/bin/bash

# -------------------------------------------- #
#                npm/install.sh                #
#                                              #
# Script to install useful NPM global modules. #
# Requires NodeJS and NPM to be installed.     #
# -------------------------------------------- #

###################
# COLOR CONSTANTS #
###################

RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
LIGHT_GREEN='\033[1;32m'
LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# clear
printf "\n ---- ${GREEN}npm/install.sh${NC} ---- \n"
printf "\nNPM Global Modules Install Script\n"
printf "\n${LIGHT_CYAN}Checking Requirements...${NC}\n\n"

#######################
# VERIFY REQUIREMENTS #
#######################

# Verify NodeJS is installed and can be found
command -v node >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}NodeJS${NC} is required but no installation could not be found! ${RED}Aborting${NC}..."
  exit 1
}
printf " * ${PURPLE}NodeJS${NC} : "
node --version
# which node # --> prints node path

# Verify NPM is installed and can be found
command -v npm >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}NPM${NC} is required but no installation could not be found! ${RED}Aborting${NC}..."
  exit 1
}
printf " * ${PURPLE}NPM${NC} : "
npm --version
# which npm # --> prints npm path

#################
# BEGIN INSTALL #
#################


printf "\n ---- ${GREEN}DONE!${NC} ---- \n\n"

# EOF #
