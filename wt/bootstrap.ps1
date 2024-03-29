<#
.SYNOPSIS
    Windows Terminal profile install script.

.DESCRIPTION
    Copies Windows Terminal profile.json to:

        "%LOCALAPPDATA%\Microsoft\Windows Terminal\settings.json"

.NOTES
    Version:        1.6
    Author:         PatEvs (github.com/patevs)
    Last Modified:  19/10/2021 - October 19th 2021

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
# $sScriptVersion = "1.6"

# Current working directory
$cwd = Get-Location

# Profile directory location
$destinationDir = "$env:LOCALAPPDATA\Microsoft\Windows Terminal"    # Legacy destination
$wtSettingsDir = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

# Icons directory location
$iconsDir = "$destinationDir\icons"

# Backgrounds directory location
$backgroundsDir = "$destinationDir\backgrounds"

# Windows Terminal installation.
# ! Note: This currently assumes Windows Terminal has been install with scoop
# ! $wtDir = Invoke-Expression "scoop prefix windows-terminal"
# ! $wt = $wtDir + "\WindowsTerminal.exe -d $cwd"

# Find Windows Terminal installation location.
# Default: $env:LOCALAPPDATA\Microsoft\WindowsApps\wt.exe
$wt = Invoke-Expression "where.exe wt.exe"

# --------------------------------- [Execution] --------------------------------- #

# TODO: Create desktop shortcut for Windows Terminal.

# Create destination, icons, and backgrounds directories
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null
New-Item $iconsDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null
New-Item $backgroundsDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy icons to destination
Copy-Item -Path ./icons/*.png -Destination $iconsDir
Copy-Item -Path ./icons/*.ico -Destination $iconsDir

# Copy backgrounds to destination
Copy-Item -Path ./backgrounds/*.gif -Destination $backgroundsDir

# Copy profile to destination
Copy-Item -Path ./settings.json -Destination $destinationDir   # Legacy destination
Copy-Item -Path ./settings.json -Destination $wtSettingsDir

# Create Windows Terminal desktop shortcut.
# https://stackoverflow.com/a/9701907/6346131
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$HOME\Desktop\Windows Terminal.lnk")
$Shortcut.TargetPath = "$wt"
$Shortcut.IconLocation = "$destinationDir\icons\windows-terminal.ico"
$Shortcut.Save()

# Clean-up variables
Remove-Variable backgroundsDir
Remove-Variable iconsDir
Remove-Variable destinationDir

# Open New Windows Terminal
Invoke-Expression "$wt -d $cwd"

# Close Old Windows Terminal
# exit

# ------------------------------------ [END] ------------------------------------ #
