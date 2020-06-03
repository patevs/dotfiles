#!/bin/bash

# ------------ #
# bootstrap.sh #
# ------------ #

# TODO: Check OS type and ensure running on linux

# Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Create config directory
mkdir -p ~/.config/nvim

# Copy init.vim config
# cp -f ./init.vim ~/.config/nvim/init.vim
cp ./init.vim ~/.config/nvim/init.vim

# Install Plugins
nvim +PlugInstall

# EOF #
