#!/bin/bash

# -------- #
# linux.sh #
# -------- #

# TODO: Ensure running as sudo

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
command -v curl >/dev/null 2>&1 || {
  echo >&2 "This script requires curl but it's not installed. Exiting..."
  exit 1
}

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
