#!/bin/bash

# beets-install.sh

# Script to install beets along with required dependencies
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

printf "\n ---- ${GREEN}beets-install.sh${NC} ---- \n"

# install beets
# python -m pip install beets

# printf " * Installing Plugin Dependencies..."
# python -m pip install discogs-client
# python -m pip install pylast

printf "\nbeets-install.sh ${GREEN}DONE!${NC}\n"