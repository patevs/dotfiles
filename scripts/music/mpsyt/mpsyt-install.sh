#!/bin/bash

# mpsyt-install.sh

# Script to install mps-youtube along with required dependencies
# TODO: set mpsyt configuration.

# Requires Python3 and pip to be installed
# also requires mpv & ffmpeg to be installed

# Define color codes

GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m' # No Color

printf "\n ---- ${GREEN}mpsyt-install.sh${NC} ---- \n\n"

# Install dependencies
python -m pip install colorama
python -m pip install youtube_dl

# Install mps-youtube
# requires ffmpeg and mpv
python -m pip install mps-youtube

# TODO: configure mpsyt

printf "\nmpsyt-install.sh ${LIGHT_GREEN}DONE!${NC}\n"

# EOF #
