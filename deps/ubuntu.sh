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

# WSL Utilities
# =============

sudo apt install ubuntu-wsl
sudo apt install xubuntu-desktop

# ------------------------------------------------------------------------------------------------------- #

# System Utilities
# ================

# Shell and Terminal

sudo apt install zsh
# Set zsh as default shell
# Note that this will not work if Zsh is not in your authorized shells list (/etc/shells)
chsh -s $(which zsh)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Development tools

sudo apt install bat
sudo apt install docker.io
sudo apt install git
sudo apt install bash-completion
sudo apt install ripgrep

sudo apt install neofetch
sudo apt install neovim
# sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
#       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
# curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
# | grep "browser_download_url.*deb" \
# | cut -d : -f 2,3 \
# | tr -d \" \
# | wget -qi -

# curl -sL https://github.com/user-or-org/repo/archive/sha1-or-ref.tar.gz

# TODO: Dynamically download latest version
# Download lsd
curl -L https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd_0.17.0_amd64.deb -o lsd_0.17.0_amd64.deb
# Install lsd
sudo dpkg -i lsd_0.17.0_amd64.deb

# ------------------------------------------------------------------------------------------------------- #

# Applications
# ============

sudo apt install firefox

# ------------------------------------------------------------------------------------------------------- #

# Developer Tools
# ===============

# Python2 and Pip
sudo apt install python2
# sudo apt install python-pip

# Python3 and Pip
sudo apt install python3
sudo apt install python3-pip

pip3 install --upgrade pip
pip3 install --upgrade setuptools

# Python Version Manager
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
# echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
# echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc
# Restart Shell
# exec "$SHELL"

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
