#!/bin/bash

# music.sh

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

# install beets

# Script to install beets along with required dependencies
# Requires Python3 and pip to be installed

clear

# ECHO. & ECHO [92m Installing Beets and Required Dependencies... [0m & ECHO.

# Install beets
# python -m pip install beets

# Install required dependencies

# python -m pip install discogs-client
# python -m pip install pylast

# ECHO. & ECHO [92m Finished Installing Beets and Required Dependencies! [0m & ECHO.

# Print pip installs

# ECHO [96m pip installs: [0m & ECHO.

# CALL python -m pip list

# install mpsyt & configure

printf "\nDone"