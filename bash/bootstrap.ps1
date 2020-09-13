<#
.SYNOPSIS
  Bash profile bootstrap script.

.DESCRIPTION
  Copies bash profile configuration files to user home.

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  13/09/2020 - September 13th 2020

.EXAMPLE
  .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Profile directory location
$destinationDir = "~"

# --------------------------------- [Execution] --------------------------------- #

# Bash-Git-Prompt
# git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

# Posh-Git-Sh
Invoke-WebRequest https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh -O ~/.git-prompt.sh
# or: curl https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh -o ~/.git-prompt.sh

# Copy files to destination directory
Copy-Item -Path ./.bash_* -Destination $destinationDir
Copy-Item -Path ./.bashrc -Destination $destinationDir
Copy-Item -Path ./.profile -Destination $destinationDir

Remove-Variable destinationDir

# Reload bash
bash

# ------------------------------------ [END] ------------------------------------ #

