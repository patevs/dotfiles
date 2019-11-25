#!/bin/bash

# ---------------------- #
# scripts/debian/asdf.sh #
# ---------------------- #

# Bash script for installing asdf-vm CLI tool.

# https://dev.to/megatux/asdf-version-manager-153a
# asdf is "generic" version manager, that with same 
# interface of commands & one setup you can handle a 
# lot of languages & tools versions altogether and 
# it is extendable via plugins.

# Resources:
#   https://github.com/asdf-vm/asdf
#
#   Installation:
#       https://asdf-vm.com/#/core-manage-asdf-vm
#   Command List:
#       https://asdf-vm.com/#/core-commands
#   Plugin List
#       https://asdf-vm.com/#/plugins-all

###################
# COLOR CONSTANTS #
###################

RED='\033[0;31m'
# GREEN='\033[0;32m'
# BROWN='\033[0;33m'
# BLUE='\033[0;34m'
# PURPLE='\033[0;35m'
CYAN='\033[0;36m'

LIGHT_GREEN='\033[1;32m'
# LIGHT_BLUE='\033[1;34m'
# LIGHT_PURPLE='\033[1;35m'
# LIGHT_CYAN='\033[1;36m'
NC='\033[0m' # No Color

BACKGROUND_GREEN='\033[42m'
# BACKGROUND_BLUE='\033[44m'
# BACKGROUND_PURPLE='\033[45m'
# BOLD='\033[1m'

################
# START SCRIPT #
################

# clear
printf "\n ${BACKGROUND_GREEN} asdf-vm install script ${NC} \n"

####################
# HELPER FUNCTIONS #
####################

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

######################
# CHECK REQUIREMENTS #
######################

printf "\n ${CYAN}Checking System Requirements...${NC}\n\n"

# Ensure git is installed
command_exists "git"

# TODO: install git if not already installed

# Install Required Dependencies
sudo apt install \
automake autoconf libreadline-dev \
libncurses-dev libssl-dev libyaml-dev \
libxslt-dev libffi-dev libtool unixodbc-dev \
unzip curl

printf "\n ${LIGHT_GREEN} All Requirements Satisfied! Installing asdf-vm...${NC}\n"

#################
# BEGIN INSTALL #
#################

# Clone the asdf repo and checkout the latest branch:
printf "\n ${CYAN} Cloning asdf repository...${NC}\n"

# TODO: remove ~/.asdf directory if exists

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

# Update .bashrc file
printf "\n ${CYAN} Updating .bashrc file...${NC}\n"

echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

# Restart shell and check asdf version
printf "\n ${CYAN} Restarting Shell...${NC}\n"

exec $SHELL

# Print asdf version
# printf "\n ${CYAN} asdf version: ${NC}\n"

# asdf current

printf "\n ${BACKGROUND_GREEN} asdf-vm install script complete! ${NC} \n"


# EOF #

