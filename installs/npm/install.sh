#!/bin/bash

# npm/install.sh

# Script to install useful NPM global modules.
# Requires Node.js and NPM to be installed.

# Define color codes

RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
LIGHT_GREEN='\033[1;32m'
LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

# clear
printf "\n ---- ${GREEN}npm/install.sh${NC} ---- \n"
printf "\nNPM GLobal Modules Install Script\n"
printf "\n${LIGHT_CYAN}Checking Requirements...${NC}\n\n"

# Verify Node.js and NPM are installed & can be found

# ECHO. & ECHO [92m Verifying NodeJS and NPM Installations... [0m
# ECHO. & ECHO  [45m NodeJS Installation: [0m & ECHO.

# Check Node
command -v node >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}Node${NC} is required but it's not installed. ${RED}Aborting${NC}."
  exit 1
}
printf " * ${PURPLE}NodeJS${NC} : "
node --version

# Check Python
# command -v python >/dev/null 2>&1 || {
#  echo >&2 "${PURPLE}Python${NC} is required but it's not installed. ${RED}Aborting${NC}."
#  exit 1
# }
# printf " * ${PURPLE}Python${NC} : "
# python -V


printf "\n ---- ${GREEN}DONE!${NC} ---- \n\n"

# EOF #
