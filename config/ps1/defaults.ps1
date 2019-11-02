# ----------------------- #
# config/ps1/defaults.ps1 #
# ----------------------- #

# Proper history etc
# Import-Module PSReadLine

# Produce UTF-8 by default
# https://news.ycombinator.com/item?id=12991690
$PSDefaultParameterValues["Out-File:Encoding"] = "utf8"

# https://technet.microsoft.com/en-us/magazine/hh241048.aspx
$MaximumHistoryCount = 10000;

# Oddly, Powershell doesn't have an inbuilt variable for the documents directory. So let's make one:
# From https://stackoverflow.com/questions/3492920/is-there-a-system-defined-environment-variable-for-documents-directory
# $env:DOCUMENTS = [Environment]::GetFolderPath("mydocuments")

# PS comes preset with 'HKLM' and 'HKCU' drives but is missing HKCR
# New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT | Out-Null

# --------------------------------------------------------------------------- #

# -------------------------------- #
# System & Utility Related Aliases #
# -------------------------------- #

# function reboot {
# 	shutdown /r /t 0
# }

# Shutdown System
function shutdownSys {
  Write-Host "`nShutting down system...`n"
  shutdown /p
}
Set-Alias -Name shut -Value shutdownSys

# Restart System
function restartSys {
  Write-Host "`nRestarting system...`n"
  shutdown /r /t 0
}
Set-Alias -Name restart -Value restartSys
Set-Alias -Name reboot -Value restartSys

# Set-Alias trash Remove-ItemSafely

function open($file) {
  invoke-item $file
}

function explorer {
  explorer.exe .
}

# function edge {
  # Old Edge
  # start microsoft-edge:
  #
  # New Chromioum Edge
#   & "${env:ProgramFiles(x86)}\Microsoft\Edge Dev\Application\msedge.exe"
# }

function settings {
  start-process ms-setttings:
}

# Truncate homedir to ~
# function limit-HomeDirectory($Path) {
#   $Path.Replace("$home", "~")
# }

# Test if running as administrator
# http://serverfault.com/questions/95431
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# --------------------------------------------------------------------------- #

# --------------------------- #
# Customize PowerShell Prompt #
# --------------------------- #

# Must be called 'prompt' to be used by pwsh
# https://github.com/gummesson/kapow/blob/master/themes/bashlet.ps1
# function prompt {
#   $realLASTEXITCODE = $LASTEXITCODE
#   Write-Host $(limit-HomeDirectory("$pwd")) -ForegroundColor Yellow -NoNewline
#   Write-Host " $" -NoNewline
#   $global:LASTEXITCODE = $realLASTEXITCODE
#   Return " "
# }

# https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
function prompt {
  # Write new line
  Write-Host
  $origLastExitCode = $LastExitCode

  # Test if running as admin
  if (Test-Administrator) {
    # if elevated
    Write-Host "(Elevated) " -NoNewline -ForegroundColor White
  }

  # Write username@computername
  # Write-Host "$env:USERNAME@" -NoNewline -ForegroundColor DarkYellow
  # Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
  # Write username
  # Write-Host "$env:USERNAME" -NoNewline -ForegroundColor DarkYellow
  # Write-Host " : " -NoNewline -ForegroundColor DarkGray

  # Build current path
  $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
  if ($curPath.ToLower().StartsWith($Home.ToLower())) {
    $curPath = "~" + $curPath.SubString($Home.Length)
  }

  # Write current path
  # Write-Host $curPath -NoNewline -ForegroundColor Blue
  Write-Host $curPath -NoNewline -ForegroundColor Magenta
  Write-Host " :" -NoNewline -ForegroundColor DarkGray

  # Write date & time
  # Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
  # Write-Host " :" -NoNewline -ForegroundColor DarkGray

  # Write posh-git status
  Write-VcsStatus
  # Have posh-git display its default prompt
  # & $GitPromptScriptBlock

  $LastExitCode = $origLastExitCode
  "`n$('>' * ($nestedPromptLevel + 1)) "
}

# --------------------------------------------------------------------------- #

# Make $lastObject save the last object output
# From http://get-powershell.com/post/2008/06/25/Stuffing-the-output-of-the-last-command-into-an-automatic-variable.aspx
# function out-default {
#   $input | Tee-Object -var global:lastobject | Microsoft.PowerShell.Core\out-default
# }

# If you prefer oh-my-posh
# Import-Module posh-git
# Import-Module oh-my-posh

# function rename-extension($newExtension){
#   Rename-Item -NewName { [System.IO.Path]::ChangeExtension($_.Name, $newExtension) }
# }


# EOF #

