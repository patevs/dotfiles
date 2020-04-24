<#

.SYNOPSIS
  Installs various PowerShell modules.

.DESCRIPTION
  This script is used to install various PowerShell modules that I find useful.

.EXAMPLE
  .\powershell.ps1

.NOTES
  File Name: powershell.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 24/04/2020 - April 24th 2020

.LINK
  Repository:
    * https://github.com/patevs/dotfiles
  Script:
    * https://github.com/patevs/dotfiles/blob/master/deps/components/powershell.ps1
#>

# Check to see if we are currently running "as Administrator"
if (!(Test-Elevated)) {
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
  exit
  # Start-Process powershell -Verb runAs
  # $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  # $newProcess.Arguments = $myInvocation.MyCommand.Definition;
  # $newProcess.Verb = "runas";
  # [System.Diagnostics.Process]::Start($newProcess);
  # exit
}

Write-Host "powershell.ps1"


# EOF #
