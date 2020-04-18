<#
.SYNOPSIS
  Neovim configuration install script.

.DESCRIPTION
  Copies init.vim to:

    "%USERPROFILE%\APPDATA\Local\nvim\init.vim"

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  19/04/2020 - April 19th 2020

.EXAMPLE
  .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Current working directory
# $cwd = Get-Location

# Destination directory location
$destinationDir = "$env:LOCALAPPDATA\nvim"

# --------------------------------- [Execution] --------------------------------- #

# Create destination and icons directories
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy init.vim to destination
Copy-Item -Path ./init.vim -Destination $destinationDir

Remove-Variable destinationDir

# ------------------------------------ [END] ------------------------------------ #
