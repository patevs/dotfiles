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

# Copy files to destination directory
Copy-Item -Path ./.bash_* -Destination $destinationDir
Copy-Item -Path ./.bashrc -Destination $destinationDir
Copy-Item -Path ./.profile -Destination $destinationDir

Remove-Variable destinationDir

# Reload bash
bash

# ------------------------------------ [END] ------------------------------------ #

