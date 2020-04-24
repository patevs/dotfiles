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

# Test if running as administrator
# http://serverfault.com/questions/95431
function Test-Elevated {
  # Get the ID and security principal of the current user account
  $userID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($userID)
  # Check to see if we are currently running "as Administrator"
  return $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Check to see if we are currently running "as Administrator"
if (!(Test-Elevated)) {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = $myInvocation.MyCommand.Definition;
  $newProcess.Verb = "runas";
  [System.Diagnostics.Process]::Start($newProcess);

  exit
}

# EOF #
