#!/bin/bash

# music.sh

# Script to install beets along with required dependencies
# mpsyt and set configuration

# Requires Python3 and pip to be installed

# Define color codes

RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

clear

printf "\n ---- ${GREEN}music.sh${NC} ---- \n"

# printf "\nRunning music.sh\n"
printf "\n${LIGHT_CYAN}Checking Requirements...${NC}\n\n"

# Python
command -v python >/dev/null 2>&1 || { 
  echo >&2 "I require python but it's not installed.  Aborting."; exit 1; 
}
printf " * ${LIGHT_BLUE}Python${NC} : "
python -V

# pip
command -v pip >/dev/null 2>&1 || { 
  echo >&2 "I require pip but it's not installed.  Aborting."; exit 1; 
}
printf " * ${LIGHT_BLUE}PIP${NC}    : "
pip -V

# ack
command -v ack >/dev/null 2>&1 || { 
  echo >&2 "I require ack but it's not installed.  Aborting."; exit 1; 
}
printf " * ${LIGHT_BLUE}ACK${NC}    : "
ack --version | ack ack


printf "\n${GREEN}Requirements Satisified!${NC}\n\n"
# Start install
# printf "${PURPLE} Starting install...${NC}\n\n"

# is colorama installed already?
#COLORAMA=$(pip list | grep colorama)
# printf "${COLORAMA}"
#if [ -z "$COLORAMA" ]
#then
#      echo "\$colorama is installed!"
#else
#      echo "\$colorama is NOT installed!"
#fi

# Install dependencies
python -m pip install colorama
python -m pip install youtube_dl
# Install mps-youtube
python -m pip install mps-youtube
# configure mpsyt
# install beets
# python -m pip install beets
# printf " * Installing Plugin Dependencies..."
# python -m pip install discogs-client
# python -m pip install pylast

# Print pip installs
printf "\n${LIGHT_CYAN}PIP List...${NC}\n\n"
# printf "  * running ${PURPLE}pip list${NC}\n\n"
pip list


printf "\n${GREEN}DONE!${NC}\n"