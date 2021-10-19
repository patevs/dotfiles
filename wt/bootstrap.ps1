<#
.SYNOPSIS
    Windows Terminal profile install script.

.DESCRIPTION
    Copies Windows Terminal profile.json to:

        "%LOCALAPPDATA%\Microsoft\Windows Terminal\settings.json"

.NOTES
    Version:        1.4
    Author:         PatEvs (github.com/patevs)
    Last Modified:  19/10/2020 - October 19th 2021

.EXAMPLE
    .\bootstrap.ps1
#>

# ------------------------------ [Initialisations] ------------------------------ #

# Check OS and ensure we are running on Windows
if (-Not ($Env:OS -eq "Windows_NT")) {
    Write-Host "Error: This script only supports Windows machines. Exiting..."
    exit 1
}

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.4"

# Current working directory
$cwd = Get-Location

# Profile directory location
$destinationDir = "$env:LOCALAPPDATA\Microsoft\Windows Terminal"

# Icons directory location
$iconsDir = "$destinationDir\icons"

# Backgrounds directory location
$backgroundsDir = "$destinationDir\backgrounds"

# Windows Terminal installation.
# ! Note: This currently assumes Windows Terminal has been install with scoop
# ! $wtDir = Invoke-Expression "scoop prefix windows-terminal"
# ! $wt = $wtDir + "\WindowsTerminal.exe -d $cwd"

# Find Windows Terminal installation location.
$wt = Invoke-Expression "where.exe wt.exe"

# --------------------------------- [Execution] --------------------------------- #

# TODO: Create desktop shortcut for Windows Terminal.

# Create destination, icons, and backgrounds directories
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null
New-Item $iconsDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null
New-Item $backgroundsDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy icons to destination
Copy-Item -Path ./icons/*.png -Destination $iconsDir

# Copy backgrounds to destination
Copy-Item -Path ./backgrounds/*.gif -Destination $backgroundsDir

# Copy profile to destination
Copy-Item -Path ./*.json -Destination $destinationDir

Remove-Variable backgroundsDir
Remove-Variable iconsDir
Remove-Variable destinationDir

# Open New Windows Terminal
Invoke-Expression "$wt -d $cwd"

# Close Old Windows Terminal
# exit

# ------------------------------------ [END] ------------------------------------ #
