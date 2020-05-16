#!/bin/bash

# --------- #
# ubuntu.sh #
# --------- #

# TODO: Ensure running as sudo

echo '' # new line

# Ensure we are running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  echo 'Error: This script can only be run on Linux systems. Exiting...' >&2
  exit 1
fi

# ------------------------------------------------------------------------------------------------------- #

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

# System Utilities
# ================

# sudo apt-get install git bash-completion

sudo apt install git
sudo apt install bash-completion
sudo apt install ripgrep

sudo apt install neofetch
sudo apt install neovim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# ------------------------------------------------------------------------------------------------------- #

# Applications
# ============

sudo apt install firefox

# ------------------------------------------------------------------------------------------------------- #

# WSL Utilities
# =============

sudo apt install ubuntu-wsl
sudo apt install xubuntu-desktop

# ------------------------------------------------------------------------------------------------------- #

# Developer Tools
# ===============

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# NodeJS LTS and NPM
nvm install --lts --latest-npm

# Java 8
sudo apt install openjdk-8-jdk

# Android SDK
# sudo apt install android-sdk

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

# Tools
# =====

# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
# curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
# | grep "browser_download_url.*deb" \
# | cut -d : -f 2,3 \
# | tr -d \" \
# | wget -qi -

# curl -sL https://github.com/user-or-org/repo/archive/sha1-or-ref.tar.gz

# Download LSD
curl -L https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd_0.17.0_amd64.deb -o lsd_0.17.0_amd64.deb
# Install LSD
sudo dpkg -i lsd_0.17.0_amd64.deb

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
