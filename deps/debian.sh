#!/bin/bash

# --------- #
# debian.sh #
# --------- #

# TODO: Ensure running as sudo
# TODO: Verify system architecture

# --------------------------------------------------------------------------------------------------- #

echo '' # new line

# Ensure we are running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
  echo 'Error: This script can only be run on Linux systems. Exiting...' >&2
  exit 1
fi

# Ensure curl command exists
if ! [ -x "$(command -v curl)" ]; then
  # echo 'Error: curl is not installed. Exiting...' >&2
  echo 'Error: curl is not installed. Installing now...' >&2
  sudo apt install curl
  # exit 2
fi

# Ensure wget command exists
if ! [ -x "$(command -v wget)" ]; then
  # echo 'Error: wget is not installed. Exiting...' >&2
  echo 'Error: wget is not installed. Installing now...' >&2
  sudo apt install wget
  # exit 3
fi

# --------------------------------------------------------------------------------------------------- #

# System Upgrade
# ==============

sudo apt update
sudo apt upgrade -y

# --------------------------------------------------------------------------------------------------- #

# WSL Utilities
# =============

# sudo apt install ubuntu-wsl
# sudo apt install xubuntu-desktop

# --------------------------------------------------------------------------------------------------- #

# System Utilities
# ================

# sudo apt install software-properties-common

# Snap
# ----

sudo apt install snapd
# sudo snap install hello-world
# hello-world

# Window Manager
# --------------

# sudo apt install dwm

# Shell and Terminal
# ------------------

# sudo add-apt-repository ppa:mmstick76/alacritty
# sudo apt install alacritty

sudo apt install gnome-terminal
# sudo apt install stterm
sudo apt install terminator

# sudo apt install zsh
# Set zsh as default shell
# Note that this will not work if Zsh is not in your authorized shells list (/etc/shells)
# chsh -s $(which zsh)

# oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --------------------------------------------------------------------------------------------------- #

# Applications
# ============

sudo apt install firefox
sudo apt install realvnc-vnc-server realvnc-vnc-viewer

# VSCode
# ------

# sudo snap install code --classic

wget https://packagecloud.io/headmelted/codebuilds/gpgkey -O - | sudo apt-key add -
curl -L https://raw.githubusercontent.com/headmelted/codebuilds/master/docs/installers/apt.sh | sudo bash
# OR:
# . <( wget -O - https://code.headmelted.com/installers/apt.sh )

# --------------------------------------------------------------------------------------------------- #

# Go Lang
# -------

sudo snap install --classic go

# sudo add-apt-repository ppa:longsleep/golang-backports
# sudo apt update
# sudo apt install golang-go

# Go Installs
# -----------

go get -u github.com/xxxserxxx/gotop/cmd/gotop

# --------------------------------------------------------------------------------------------------- #

# Java 8
# ------

sudo apt install openjdk-8-jdk

# --------------------------------------------------------------------------------------------------- #

# NodeJS and NPM
# --------------

# Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Previous node version
# previous-node=$(nvm current)

# NodeJS LTS and NPM
nvm install --lts --latest-npm

# nvm install --lts --latest-npm --reinstall-packages-from=$(nvm current)
# nvm install --lts --latest-npm --reinstall-packages-from=12.17.0
# nvm reinstall-packages previous-node

# NPM Global Installs
# -------------------

# npm install --global @commitlint/cli commitlint-config-gitmoji add-gitignore check-it-out diff-so-fancy gitmoji-cli david npm-check npm-check-updates ntl typescript typesync licensed neovim react-native-cli gtop wifi-password-cli corona-cli

# Git Integrations and Utilities
npm install --global @commitlint/cli
npm install --global commitlint-config-gitmoji
npm install --global add-gitignore
npm install --global check-it-out
# Note: Requires Perl
npm install --global diff-so-fancy

# NodeJS and NPM Utility Modules
npm install --global gitmoji-cli
# npm install --global husky
npm install --global david
npm install --global npm-check
npm install --global npm-check-updates
npm install --global ntl

# TypeScript and Utility Modules
npm install --global typescript
npm install --global typesync

# Development Utility Modules
npm install --global licensed
npm install --global neovim

# React Native Development Utility Modules
# npm install --global ignite-cli
npm install --global react-native-cli

# System Utility Modules
npm install --global gtop
npm install --global wifi-password-cli

# Miscellaneous Modules
npm install --global corona-cli

# --------------------------------------------------------------------------------------------------- #

# Perl
# ----

sudo apt install perl

# --------------------------------------------------------------------------------------------------- #

# Python2 and PIP
# ---------------

# sudo apt install python2
# sudo apt install python-pip

# Python3 and PIP
# ---------------

# sudo apt install python3
# sudo apt install python3-pip

# pip3 install --upgrade pip
# pip3 install --upgrade setuptools

# Python Version Manager
# ----------------------

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

# Restart Shell
exec "$SHELL"

# Install Python2 and Python3

# Dependencies
sudo apt install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

pyenv install 2.7.18
pyenv install 3.8.3

pyenv global 3.8.3 2.7.18 system

pyenv rehash

# Python2 Installs
# ----------------

python2 -m pip install --upgrade pip
python2 -m pip install --upgrade setuptools
python2 -m pip install --upgrade wheel

python2 -m pip install --upgrade neovim
python2 -m pip install --upgrade virtualenv

# Python3 Installs
# ----------------

python3 -m pip install --upgrade pip
python3 -m pip install --upgrade setuptools
python3 -m pip install --upgrade wheel

python3 -m pip install --upgrade neovim

# --------------------------------------------------------------------------------------------------- #

# Ruby and Ruby Gems
# ------------------

sudo apt install ruby-full

# Ruby Gems
sudo gem update --system
sudo gem update

sudo gem install bundler
sudo gem install rails
sudo gem install neovim

# Rbenv

# Dependencies
# sudo apt install git libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev
# curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -

# Add `$HOME/.rbenv/bin` to user path
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(rbenv init -)"' >> ~/.bashrc
# source ~/.bashrc
# If using ZSH
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(rbenv init -)"' >> ~/.zshrc
# source ~/.zshrc

# Install ruby
# rbenv install 2.6.6
# rbenv global 2.6.6
# rbenv install 2.7.1
# rbenv global 2.7.1

# Ruby Version Manager (RVM)

# Dependencies
# sudo apt install g++, gcc, autoconf, automake, bison, libc6-dev, libffi-dev, libgdbm-dev, libncurses5-dev, libsqlite3-dev, libtool, libyaml-dev, make, pkg-config, sqlite3, zlib1g-dev, libgmp-dev, libreadline-dev, libssl-dev

# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# OR:
# gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Install RVM
# curl -sSL https://get.rvm.io | bash -s stable
# Install RVM with default Ruby and Rails
# curl -sSL https://get.rvm.io | bash -s stable --rails

# Activate RVM
# source ~/.rvm/scripts/rvm

# rvm install 2.7.1
# rvm use 2.7.1 --default

# --------------------------------------------------------------------------------------------------- #

# Rustup
# ------

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

rustup self update
rustup update

# Cargo Installs
# --------------

cargo install bat
cargo install eva
# cargo install git-delta
cargo install lsd
# cargo install tokei

# --------------------------------------------------------------------------------------------------- #

# Developer Tools
# ===============

# sudo apt install android-sdk
sudo apt install bash-completion
# sudo apt install bat
# sudo apt install docker.io
sudo apt install git
sudo apt install hub
sudo apt install jq
sudo apt install neofetch
sudo apt install neovim
sudo apt install ripgrep

# Yarn
# ----

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install yarn

# Bat
# ---

# curl -L https://github.com/sharkdp/bat/releases/download/v0.15.4/bat_0.15.4_armhf.deb -o bat_0.15.4_armhf.deb
# sudo dpkg -i bat_0.15.4_armhf.deb
# rm bat_0.15.4_armhf.deb

# LSDeluxe (LSD)
# --------------

# sudo snap install lsd

# TODO: Dynamically download latest version
# curl -L https://github.com/Peltoche/lsd/releases/download/0.17.0/lsd_0.17.0_amd64.deb -o lsd_0.17.0_amd64.deb
# sudo dpkg -i lsd_0.17.0_amd64.deb
# rm lsd_0.17.0_amd64.deb

# https://gist.github.com/steinwaywhw/a4cd19cda655b8249d908261a62687f8
# curl -s https://api.github.com/repos/jgm/pandoc/releases/latest \
# | grep "browser_download_url.*deb" \
# | cut -d : -f 2,3 \
# | tr -d \" \
# | wget -qi -

# curl -sL https://github.com/user-or-org/repo/archive/sha1-or-ref.tar.gz

# --------------------------------------------------------------------------------------------------- #

# Fonts
# =====

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

# Hack NF
curl -fLo "Hack Regular Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf

# --------------------------------------------------------------------------------------------------- #

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

# --------------------------------------------------------------------------------------------------- #

# EOF #
