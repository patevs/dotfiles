#!/bin/sh

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
# BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
# CYAN='\033[0;36m'

LIGHT_GREEN='\033[1;32m'
LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# clear
# printf "\n ---- ${GREEN}npm/install.sh${NC} ---- \n"
printf "\n ${GREEN}NPM Global Modules Install Script${NC}\n"
printf "\n ${LIGHT_BLUE}Checking Requirements...${NC}\n\n"
# printf "\n ${CYAN}NPM Global Modules Install Script${NC}\n"
# printf "\n ${LIGHT_CYAN}Checking Requirements...${NC}\n\n"

#######################
# VERIFY REQUIREMENTS #
#######################

# Verify NodeJS is installed and can be found
command -v node >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}NodeJS${NC} is required but no installation could not be found! ${RED}Aborting${NC}..."
  exit 1
}
printf "  * ${PURPLE}NodeJS${NC} : "
node --version
# which node # --> prints node path

# Verify NPM is installed and can be found
command -v npm >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}NPM${NC} is required but no installation could not be found! ${RED}Aborting${NC}..."
  exit 1
}
printf "  * ${PURPLE}NPM${NC} : "
npm --version
# which npm # --> prints npm path

#################
# BEGIN INSTALL #
#################


printf "\n ${LIGHT_GREEN}All Requirements Satisfied! Installing NPM Global Modules...${NC}\n"

printf "\n ${BLUE} Installing Git Integration and Utility Modules:${NC}\n"

exit 0

# https://github.com/TejasQ/add-gitignore
npm install --global add-gitignore
# https://github.com/so-fancy/diff-so-fancy
npm install --global diff-so-fancy
# https://github.com/svhawks/g3l
npm install --global g3l
# https://github.com/paulirish/git-open
npm install --global git-open

printf "Installing NodeJS Utility Modules: "

# https://github.com/alanshaw/david
npm install --global david
# https://github.com/dylang/npm-check
npm install --global npm-check
# https://github.com/tjunnone/npm-check-updates
npm install --global npm-check-updates
# https://github.com/ruyadorno/ntl
npm install --global ntl
# https://github.com/siddharthkp/cost-of-modules
npm install --global cost-of-modules

printf "Installing Development Utility Modules: "

# Google's website performance test
# https://github.com/GoogleChrome/lighthouse/
npm install --global lighthouse
# Progressive web metrics
# https://github.com/paulirish/pwmetrics
npm install --global pwmetrics

printf "Installing System Utility Modules: "

# https://github.com/sindresorhus/empty-trash-cli
npm install --global empty-trash-cli
# https://github.com/sindresorhus/trash-cli
npm install --global trash-cli
# https://github.com/kevva/wifi-password-cli
npm install --global wifi-password-cli
# https://github.com/sindresorhus/open-cli
npm install --global open-cli

printf "Finsihed Installing NPM Global Modules!"
printf "Listing NPM Global Installs: "

npm list --global --depth=0

printf "\n ---- ${GREEN}DONE!${NC} ---- \n\n"

# EOF #
