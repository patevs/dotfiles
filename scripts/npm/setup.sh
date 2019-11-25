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

printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"

#################
# BEGIN INSTALL #
#################

# printf "\n  ${BACKGROUND_GREEN} Installing Git Integration and Utility Modules: ${NC}\n\n"

# ...

# printf "\n ${LIGHT_GREEN} Finished Installing NPM Global Modules!${NC}\n"
# printf "\n  ${BACKGROUND_GREEN} Listing NPM Global Installs: ${NC}\n\n"

# npm list --global --depth=0

printf "\n ${BACKGROUND_GREEN} DONE! ${NC} \n\n"

# EOF #
