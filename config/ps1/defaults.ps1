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

# Check if a given PowerShell module is installed
# https://stackoverflow.com/questions/28740320/how-do-i-check-if-a-powershell-module-is-installed
function Check-Module($modname){
  return [bool](Get-Module -ListAvailable -Name $modname)
}

# Import PSReadLine module if installed
# Proper history etc
if (Check-Module "PSReadLine") { Import-Module -Name PSReadLine }

# Show selection menu for tab
# Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete

# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}

# Import posh-git module if installed
if (Check-Module "posh-git") { Import-Module -Name posh-git }

# Dracula Prompt Configuration
# $GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
# $GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
# $GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
# $GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
# $GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n > '
# Dracula Git Status Configuration
# $GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
# $GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
# $GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue

# Import Terminal-Icons module if installed
# if (Check-Module "Terminal-Icons") { Import-Module -Name Terminal-Icons }

# Import Get-ChildItemColor module if installed
# if (Check-Module "Get-ChildItemColor") { Import-Module -Name Get-ChildItemColor }

# Start SSH agent
# TODO: Fix this
# Start-SshAgent

# Clear the screen
# clear

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

# --------------------------------------------------------------------------- #

# Move to Desktop Directory (~\desktop)
function moveDesktop {
  $desktopPath = $env:USERPROFILE + "\desktop"
  Set-Location $desktopPath
}
Set-Alias -Name desktop -Value moveDesktop
Set-Alias -Name desk -Value moveDesktop

# Move to Development Directory (~\desktop\git)
# TODO: Ensure this directory exists
# TODO: Run `winfetch`
function moveDev {
  $devPath = $env:USERPROFILE + "\desktop\git"
  Set-Location $devPath
  # getDir
  # Write-Host # New line
  # if (Check-Command lsd) { lsd }
}
Set-Alias -Name dev -Value moveDev

# --------------------------------------------------------------------------- #

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

