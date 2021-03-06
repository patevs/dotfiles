<#
.SYNOPSIS
    Windows Terminal profile install script.

.DESCRIPTION
    Copies Windows Terminal profile.json to:

        "%LOCALAPPDATA%\Microsoft\Windows Terminal\settings.json"

.NOTES
    Version:        1.3
    Author:         PatEvs (github.com/patevs)
    Last Modified:  18/12/2020 - December 18th 2020

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
# $sScriptVersion = "1.3"

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
# TODO: Locate install location when not using scoop
$wtDir = Invoke-Expression "scoop prefix windows-terminal"
$wt = $wtDir + "\WindowsTerminal.exe -d $cwd"

# --------------------------------- [Execution] --------------------------------- #

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
Invoke-Expression "$wt"

# Close Old Windows Terminal
# exit

# ------------------------------------ [END] ------------------------------------ #
