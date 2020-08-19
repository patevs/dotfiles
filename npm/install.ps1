<# npm/install.ps1

TODO:
  * Check currently installed NPM global modules.
  * Add argument parameter for upgrading global NPM installation.
  * Ensure dependency requirements are met for each module.

.SYNOPSIS
  `PowerShell` script for installing various useful global `NPM` modules.

  ! Requires `NodeJS` and `NPM` to be installed.

.DESCRIPTION
  1. Ensure `NodeJS` and `NPM` are installed and check versions.
  2. (WIP) Check currently installed global `NPM` modules.
  3. (Optional) Upgrade global `NPM` installation.
  4. Install `NPM` global modules ensuring required dependencies are met for each.

  Tested Node Versions:
    * 13.11.0
    * 12.16.1
    * 10.19.0
    * 8.17.0

  **NOTE** : This script will install the [`PSWriteColor`](https://github.com/EvotecIT/PSWriteColor) module.

.EXAMPLE
  .\globals.ps1

.NOTES
  File Name: globals.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 28/03/2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/npm/installs/globals.ps1
#>

# ---------------- #
# HELPER FUNCTIONS #
# ---------------- #

# Check if a given PowerShell module is installed
Function ExistsModule ($moduleName) {
  return [bool](Get-Module -ListAvailable -Name $moduleName)
}

# Check if a given command exists
# https://stackoverflow.com/questions/3919798/how-to-check-if-a-cmdlet-exists-in-powershell-at-runtime-via-script
Function ExistsCommand($cmdName) {
  # return [bool](Get-Command -Name $cmdName -ea 0)
  return [bool](Get-Command -Name $cmdName -ErrorAction SilentlyContinue)
}

# ------------------------------------------------------------------------------------------- #

# Print a welcome message
Write-Host ""
Write-Host " NPM Global Modules Install Script " -BackgroundColor Magenta -ForegroundColor Black

# Verify if PSWriteColor module is installed
if (-Not (ExistsModule PSWriteColor)) {
  Write-Host "`n PSWriteColor module is not installed. " -NoNewline
  Write-Host "Installing Now... " -ForegroundColor Green -NoNewline
  Install-Module -Name PSWriteColor
  Write-Host " Done " -BackgroundColor Green -ForegroundColor Black
}
Import-Module PSWriteColor
# Uninstall-Module PSWriteColor

# Verify NodeJS and NPM are installed
Write-Color " `n Verifying ", "NodeJS", " and ", "NPM", " Installations... `n" -C White, Cyan, White, Cyan, White

# NodeJS
if (ExistsCommand node) {
  $nodeVersion = Invoke-Expression "node --version"
  Write-Color "+--------+----------+" -StartSpace 4
  Write-Color "|", " NodeJS ", "|", " $nodeVersion ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+--------+----------+" -StartSpace 4
} else {
  Write-Color "NodeJS", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# NPM
if (ExistsCommand npm) {
  $npmVersion = Invoke-Expression "npm --version"
  Write-Color "|", "  NPM   ", "|", "  $npmVersion  ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+--------+----------+" -StartSpace 4
} else {
  Write-Color "NPM", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# Begin install
Write-Color " `n All Requirements Satisfied! ", "Beginning Install... `n" -C White, Green

# Upgrade NPM
# Write-Color " `n Upgrading ", "NPM", "..." -C White, Cyan, White
# Invoke-Expression "npm install --global npm"
# Write-Color " `n Done" -C Green

# $nodeGlobals = Invoke-Expression "npm list --global --depth=0"

Write-Color " Existing NPM Globals `n $nodeGlobals"

# Write-Color "Installing NPM Global Modules..." -StartSpaces 4

# ------------------------------------------------------------------------------------------- #

# EOF #

