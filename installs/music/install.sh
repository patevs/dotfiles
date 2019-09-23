#!/bin/bash

# music-install.sh

# Script to install mpsyt & beets along with required dependencies
# TODO: set mpsyt configuration
# Requires Python3 and pip to be installed

# Define color codes

RED='\033[0;31m'
GREEN='\033[0;32m'
# BROWN='\033[0;33m'
# BLUE='\033[0;34m'
PURPLE='\033[0;35m'
# CYAN='\033[0;36m'
# LIGHT_GRAY='\033[0;37m'
# LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
# YELLOW='\033[1;33m'
# LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
# WHITE='\033[1;37m'
NC='\033[0m' # No Color

# clear
printf "\n ---- ${GREEN}music.sh${NC} ---- \n"
printf "\n${LIGHT_CYAN}Checking Requirements...${NC}\n\n"

# Check Python
command -v python >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}Python${NC} is required but it's not installed. ${RED}Aborting${NC}."
  exit 1
}
printf " * ${PURPLE}Python${NC} : "
python -V

# Check Pip
command -v pip >/dev/null 2>&1 || {
  echo >&2 "${PURPLE}Pip${NC} is required but it's not installed. ${RED}Aborting${NC}."
  exit 1
}
printf " * ${PURPLE}Pip${NC}    : "
pip -V

# Start install
printf "\n${LIGHT_GREEN}Requirements Satisified! Beginning Install...${NC}\n"

# Install mps-youtube
bash mpsyt/mpsyt-install.sh
# Install beets
# bash beets/beets-install.sh

# Print pip installs
# printf "\n${LIGHT_CYAN}PIP List...${NC}\n\n"
# printf "  * running ${PURPLE}pip list${NC}\n\n"
# pip list

printf "\n${GREEN}DONE!${NC}\n\n"

# EOF #
