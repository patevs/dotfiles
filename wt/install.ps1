<#
.SYNOPSIS
  Windows Terminal profile install script.

.DESCRIPTION
  Copies Windows Terminal profile.json to:

    "%LOCALAPPDATA%\Microsoft\Windows Terminal\profiles.json"

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  08/04/2020 - April 8th 2020

.EXAMPLE
  .\install.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Profile location
$destinationDir = "$env:LOCALAPPDATA\Microsoft\Windows Terminal"

# --------------------------------- [Functions] --------------------------------- #

# ..

# --------------------------------- [Execution] --------------------------------- #

# TODO: Create destination directory if doesnt exist already
# New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue

# Copy icons to destination
Copy-Item -Path ./icons/powershell-256.png -Destination $destinationDir/icons

# Copy profile to destination
Copy-Item -Path ./profiles.json -Destination $destinationDir

Remove-Variable destinationDir

# Reload Windows Terminal
Invoke-Expression "wt"

# ------------------------------------ [END] ------------------------------------ #
