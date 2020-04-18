<#
.SYNOPSIS
  Windows Terminal profile install script.

.DESCRIPTION
  Copies Windows Terminal profile.json to:

    "%LOCALAPPDATA%\Microsoft\Windows Terminal\profiles.json"

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
$cwd = Get-Location

# Profile directory location
$destinationDir = "$env:LOCALAPPDATA\Microsoft\Windows Terminal"

# Icons directory location
$iconsDir = "$destinationDir\icons"

# Windows Terminal installation.
# Note: Assumes Windows Terminal has been install with scoop
$wtDir = Invoke-Expression "scoop prefix windows-terminal"
$wt = $wtDir + "WindowsTerminal.exe -d $cwd"

# --------------------------------- [Execution] --------------------------------- #

# Create destination and icons directories
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null
New-Item $iconsDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy icons to destination
Copy-Item -Path ./icons/*.png -Destination $iconsDir

# Copy profile to destination
Copy-Item -Path ./profiles.json -Destination $destinationDir

Remove-Variable iconsDir
Remove-Variable destinationDir

# Open New Windows Terminal
Invoke-Expression "$wt"

# Close Old Windows Terminal
# exit

# ------------------------------------ [END] ------------------------------------ #
