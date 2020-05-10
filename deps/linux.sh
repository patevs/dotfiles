#!/bin/bash

# -------- #
# linux.sh #
# -------- #

# TODO: Ensure running as sudo

# Helper Functions
# ================

# Check that a given command is available
# command_exists () {
#   type "$1" &> /dev/null ;
# }

# ------------------------------------------------------------------------------------------------------- #

# System Upgrade
# ==============

sudo apt update
sudo apt upgrade -y

# ------------------------------------------------------------------------------------------------------- #

# Fonts
# =====

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# Ensure curl command exists
if ! [ -x "$(command -v curl)" ]; then
  echo 'Error: curl is not installed. Exiting...' >&2
  exit 1
fi

# Hack NF
curl -fLo "Hack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

# ------------------------------------------------------------------------------------------------------- #

# Homebrew Installs
# =================

# Install Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install the Homebrew dependencies
# sudo apt-get install build-essential

# Configure Homebrew in your .profile by running
# echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/pat/.profile

# Add Homebrew to your PATH
# eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Install GCC
# brew install gcc

# EOF #
