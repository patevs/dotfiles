#!/bin/bash

# beets-install.sh

# Script to install beets along with required dependencies
# Requires Python3 and pip to be installed

# Define color codes

GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m' # No Color

printf "\n ---- ${GREEN}beets-install.sh${NC} ---- \n\n"

# Install beets
python -m pip install beets

# Install plugin dependencies
# printf " * Installing Plugin Dependencies..."
python -m pip install discogs-client
python -m pip install pylast

printf "\nbeets-install.sh ${LIGHT_GREEN}DONE!${NC}\n"

# EOF #
