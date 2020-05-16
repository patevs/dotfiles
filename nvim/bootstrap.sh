#!/bin/bash

# ------------ #
# bootstrap.sh #
# ------------ #

# /home/pat/.config/nvim/init.vim

# Install Vim-Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Copy init.vim config
cp init.vim /home/pat/.config/nvim/init.vim

# Install Plugins
nvim +PlugInstall

# EOF #
