#!/bin/bash

# ----------------- #
# bash/bootstrap.sh #
# ----------------- #

# Bash script for easily setting up my bash configuration
# The script copies '.bash_aliases', '.bash_profile', '.bashrc', and '.profile'
# into my home directory.

# Posh-Git-Sh
# TODO: Ensure curl command exists
curl https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh -o ~/.git-prompt.sh
# wget https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh -O ~/.git-prompt.sh

cp .bash_aliases ~/.bash_aliases
cp .bash_profile ~/.bash_profile
cp .bashrc ~/.bashrc
cp .profile ~/.profile

# Reload bash
bash

# EOF #

