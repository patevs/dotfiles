#!/bin/bash

# -------------------- #
# scripts/npm/setup.sh #
# -------------------- #

# Bash script to setup NPM global configuration.
# Requires NodeJS and NPM to be installed.

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

################
# START SCRIPT #
################

# clear
printf "\n ${BACKGROUND_GREEN} NPM Global Configuration Setup Script ${NC} \n"

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

#######################
# VERIFY REQUIREMENTS #
#######################

printf "\n ${CYAN}Checking System Requirements...${NC}\n\n"

# Verify NodeJS is installed and can be found
if command_exists "node"; then
  printf "\n ${BACKGROUND_PURPLE} NodeJS installation: ${NC}\n\n"
  # which node # --> prints path to node
  node --version
else
  printf "\n ${RED}Error:${NC} NodeJS is not installed. Exiting...\n\n" # >&2
  exit 1
  # TODO: Install NodeJS
fi

# Verify NPM is installed and can be found
if command_exists "npm"; then
  printf "\n ${BACKGROUND_PURPLE} NPM installation: ${NC}\n\n"
  # which npm # --> prints path to npm
  npm --version
else
  printf "\n ${RED}Error:${NC} NPM is not installed. Exiting...\n\n" # >&2
  exit 1
fi

printf "\n ${LIGHT_GREEN}All Requirements Satisfied! Starting NPM Global Configuration Setup...${NC}\n"

#################
# BEGIN INSTALL #
#################

printf "\n  ${BACKGROUND_GREEN} Setting NPM Global Configuration ${NC}\n\n"

# Set Username and email
printf "\n ${LIGHT_GREEN}Setting Username and Email...${NC}\n"

npm config set --global init.author.email "ppevans11@gmail.com" 
npm config set --global init.author.name "PatEvs"
npm config set --global init.author.url "https://github.com/patevs"
npm config set --global init.license "MIT"

# Print NPM global configuration
printf "\n ${LIGHT_GREEN}NPM Global Configuration:${NC}\n"

npm config list --global

printf "\n ${BACKGROUND_GREEN} DONE! ${NC} \n\n"

# EOF #
