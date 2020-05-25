<# scripts/git/installs/git-extras.ps1

TODO:
  * Allow for passing of git location as an argument.
  * Add option to allow for uninstall

.SYNOPSIS
  `PowerShell` script for installing [`git-extras`](https://github.com/tj/git-extras) utilities.

  ! Requires `git` to be installed.

.DESCRIPTION
  1. Ensure `git` is installed and attempts to find the executable
      location (first path in where git.exe wins) on disk.

  2. Clone the `git-extras` repository and run the provided install.cmd script.

  3. Delete the `git-extras` repository as it is no longer needed.

  **Note** : This script will install the [`PSWriteColor`](https://github.com/EvotecIT/PSWriteColor) module.

.EXAMPLE
  .\git-extras.ps1

.NOTES
  File Name: git-extras.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 28/03/2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/git/installs/git-extras.ps1
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
Write-Host " Git-Extras Utilities Install Script " -BackgroundColor Magenta -ForegroundColor Black

# Verify if PSWriteColor module is installed
if (-Not (ExistsModule PSWriteColor)) {
  Write-Host "`n PSWriteColor module is not installed. " -NoNewline
  Write-Host "Installing Now... " -ForegroundColor Green -NoNewline
  Install-Module -Name PSWriteColor
  Write-Host " Done " -BackgroundColor Green -ForegroundColor Black
}
Import-Module PSWriteColor
# Uninstall-Module PSWriteColor

# Verify git is installed
Write-Color " `n Verifying ", "Git", " Installation... `n" -C White, Cyan, White

# Verify if git executable is at default location
$gitPath = "$env:ProgramFiles\Git"
if (-Not (Test-Path $gitPath)) {
  # Attempt to find the path using scoop
  $gitPath = Invoke-Expression "scoop prefix git"
}

if (ExistsCommand git) {
  $gitVersionLong = Invoke-Expression "$gitPath\bin\git.exe --version"
  $gitVersion = $gitVersionLong -replace "git version "
  Write-Color "+-------+------------------+" -StartSpace 4
  Write-Color "|", "  Git  ", "|", " $gitVersion ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+-------+------------------+" -StartSpace 4
  # Verify if hub is installed
  $hubPath = Invoke-Expression "scoop prefix hub"
  if (ExistsCommand hub) {
    $hubVersion = Invoke-Expression "$hubPath\bin\hub.exe version"
    $hubVersion = $hubVersion -replace "$gitVersionLong"
    $hubVersion = $hubVersion -replace "hub version "
    Write-Color "|", "  Hub  ", "|", "$hubVersion ", "          |" -C White, Cyan, White, Green, White -StartSpace 4
    Write-Color "+-------+------------------+" -StartSpace 4
  }
} else {
  Write-Color "Git", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  EXIT
}

# Begin install
Write-Color " `n All Requirements Satisfied! ", "Beginning Install... `n" -C White, Green
# Write-Color "Installing ", "git-extras", " Utilities..." -C White, Green, White -StartSpaces 2

# Clone the git-extras repository
Write-Color "Cloning ", "git-extras", " repository...`n" -C White, Green, White -StartSpaces 2
Invoke-Expression "git clone https://github.com/tj/git-extras.git"

# Run the install script
Write-Color ""
Write-Color "`Running ", "git-extras", " install script...`n" -C White, Green, White -StartSpaces 2

# Invoke-Expression "git-extras\install.cmd $gitLocation"
git-extras\install.cmd $gitPath

# Lastly, remove the `git-extras` repository
Remove-Item -Recurse -Force "git-extras"
Write-Color ""
Write-Color " DONE " -B DarkGreen -C White -StartSpaces 2

# ------------------------------------------------------------------------------------------- #

# EOF #

