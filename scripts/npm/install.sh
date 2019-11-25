#!/bin/bash

# ---------------------- #
# scripts/npm/install.sh #
# ---------------------- #

# Bash script to install useful NPM global modules.
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
printf "\n ${BACKGROUND_GREEN} NPM Global Modules Install Script ${NC} \n"

####################
# HELPER FUNCTIONS #
####################

# Verify NodeJS is installed and can be found
# command -v node >/dev/null 2>&1 || {
  # echo >&2 "${BACKGROUND_PURPLE}NodeJS${NC} is required but no installation could not be found! ${RED}Aborting${NC}..."
  # printf " ${BACKGROUND_PURPLE} NodeJS ${NC} is required but no installation could not be found! ${RED}Aborting${NC}..."
  # exit 1
# }

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

printf "\n  ${BACKGROUND_GREEN} Installing Git Integration and Utility Modules: ${NC}\n\n"

# https://github.com/TejasQ/add-gitignore
# npm install --global add-gitignore
# https://github.com/so-fancy/diff-so-fancy
npm install --global diff-so-fancy
# https://github.com/svhawks/g3l
npm install --global g3l
# https://github.com/paulirish/git-open
npm install --global git-open

printf "\n  ${BACKGROUND_GREEN} Installing NodeJS Utility Modules: ${NC}\n\n"

# https://github.com/alanshaw/david
npm install --global david
# https://github.com/dylang/npm-check
# npm install --global npm-check
# https://github.com/tjunnone/npm-check-updates
# npm install --global npm-check-updates
# https://github.com/ruyadorno/ntl
npm install --global ntl
# https://github.com/siddharthkp/cost-of-modules
# npm install --global cost-of-modules

# printf "\n  ${BACKGROUND_GREEN} Installing Development Utility Modules: ${NC}\n\n"

# License generator
# https://github.com/plibither8/licensed
# CALL npm install --global licensed
# Google's website performance test
# https://github.com/GoogleChrome/lighthouse/
# npm install --global lighthouse
# https://github.com/cezaraugusto/mklicense
# CALL npm install --global mklicense
# Progressive web metrics
# https://github.com/paulirish/pwmetrics
# npm install --global pwmetrics
# https://github.com/jhotmann/node-rename-cli
# CALL npm install --global rename-cli

printf "\n  ${BACKGROUND_GREEN} Installing System Utility Modules: ${NC}\n\n"

# https://github.com/sindresorhus/empty-trash-cli
npm install --global empty-trash-cli
# https://github.com/aksakalli/gtop
# CALL npm install --global gtop
# https://github.com/sindresorhus/trash-cli
npm install --global trash-cli
# https://github.com/kevva/wifi-password-cli
npm install --global wifi-password-cli
# https://github.com/sindresorhus/open-cli
# npm install --global open-cli

printf "\n ${LIGHT_GREEN} Finished Installing NPM Global Modules!${NC}\n"
printf "\n  ${BACKGROUND_GREEN} Listing NPM Global Installs: ${NC}\n\n"

npm list --global --depth=0

printf "\n ${BACKGROUND_GREEN} DONE! ${NC} \n\n"

# EOF #
