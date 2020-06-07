# ----------------- #
# choco/install.ps1 #
# ----------------- #

# PowerShell script used to install chocolatey package manager.
# NOTE: This script must be run as administrator.

function Test-IsAdmin {
  try {
      $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
      $principal = New-Object Security.Principal.WindowsPrincipal -ArgumentList $identity
      return $principal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )
  } catch {
      throw "Failed to determine if the current user has elevated privileges. The error was: '{0}'." -f $_
  }
  <#
    .SYNOPSIS
      Checks if the current Powershell instance is running with elevated privileges or not.
    .EXAMPLE
      PS C:\> Test-IsAdmin
    .OUTPUTS
      System.Boolean
          True if the current Powershell is elevated, false if not.
    .NOTES
      Can also use:
        `#Requires -RunAsAdministrator`
  #>
}

if ( -Not (Test-IsAdmin) ) {
  Write-Host ""
  Write-Host " ERROR " -BackgroundColor Red -ForegroundColor White -NoNewline
  Write-Host " This script must be run with elevated privilages. " -NoNewline
  Write-Host "Exiting...`n" -ForegroundColor Red
  exit
}

Set-ExecutionPolicy Bypass -Scope Process -Force

[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# EOF #
