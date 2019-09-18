#!/bin/bash

# music.sh

# Script to install beets along with required dependencies
# mpsyt and set configuration

# Requires Python3 and pip to be installed

clear

# Define color codes

RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_BLUE='\033[1;34m'
NC='\033[0m' # No Color

printf "\nRunning music.sh\n"
printf "\nChecking Requirements...\n\n"

# Python
command -v python >/dev/null 2>&1 || { 
  echo >&2 "I require python but it's not installed.  Aborting."; exit 1; 
}
printf " * Python: "
python -V

# pip
command -v pip >/dev/null 2>&1 || { 
  echo >&2 "I require pip but it's not installed.  Aborting."; exit 1; 
}
printf " * pip: "
pip -V

# Start install
printf "\nRequirements Satisified!\n Starting install...\n"
# install beets
printf " * Installing Beets..."
# Install beets
# python -m pip install beets

# Install required dependencies
printf " * Installing Plugin Dependencies..."
# python -m pip install discogs-client
# python -m pip install pylast

# ECHO. & ECHO [92m Finished Installing Beets and Required Dependencies! [0m & ECHO.

# Print pip installs

# ECHO [96m pip installs: [0m & ECHO.

# CALL python -m pip list

# install mpsyt & configure

printf "\nDone"