#!/bin/bash

# -------- #
# linux.sh #
# -------- #

# TODO: Ensure running as sudo

# ------------------------------------------------------------------------------------------------------- #

# Homebrew Installs
# =================

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install the Homebrew dependencies
sudo apt-get install build-essential

# Configure Homebrew in your /home/pat/.profile by running
echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/pat/.profile

# Add Homebrew to your PATH
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Install GCC
brew install gcc

# EOF #
