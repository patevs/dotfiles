# ---------------------- #
# components/console.ps1 #
# ---------------------- #

# Write-Output "components/console.ps1"

# Utilities to manage PowerShell Consoles
# Based on code from ConCFG: https://github.com/lukesampson/concfg/

# Test if running as administrator
# http://serverfault.com/questions/95431
function Test-Elevated {
  # Get the ID and security principal of the current user account
  $userID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($userID)
  # Check to see if we are currently running "as Administrator"
  return $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

# --------------------------------------------------------------------------------------------- #

# Produce UTF-8 by default
# https://news.ycombinator.com/item?id=12991690
# $PSDefaultParameterValues["Out-File:Encoding"] = "utf8"

# https://technet.microsoft.com/en-us/magazine/hh241048.aspx
$MaximumHistoryCount = 10000;

# Import PSReadLine module (if installed) for Proper history, tab completion, etc
if (Get-Module -ListAvailable PSReadLine -ErrorAction SilentlyContinue) {
  Import-Module -Name PSReadLine
  # Show selection menu for tab
  Set-PSReadlineKeyHandler -Chord Tab -Function MenuComplete
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
}

# Posh-Git Configuration

# Remove 'posh~git' prefix from terminal title
# https://github.com/dahlbyk/posh-git/issues/424#issue-208094847
$Global:GitPromptSettings.EnableWindowTitle = $true

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

# Start SSH agent redirecting output to null
# https://stackoverflow.com/a/6461021
# Start-SshAgent 2>&1 | Out-Null
# Start-SshAgent 2>&1> $null

# --------------------------------------------------------------------------------------------- #

# --------------------------- #
# Customize PowerShell Prompt #
# --------------------------- #

# $wakatime = $(which wakatime);

# Must be called 'prompt' to be used by pwsh
# https://github.com/gummesson/kapow/blob/master/themes/bashlet.ps1
# https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
function prompt {
  # Write new line
  Write-Host
  $origLastExitCode = $LastExitCode

  # Test if running as admin
  if (Test-Elevated) {
    # if elevated
    Write-Host "[ADMIN] " -NoNewline -ForegroundColor White
  }


  # Build current path
  $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
  if ($curPath.ToLower().StartsWith($Home.ToLower())) {
    $curPath = "~" + $curPath.SubString($Home.Length)
  }

  # Write current path
  Write-Host $curPath -NoNewline -ForegroundColor Magenta
  Write-Host " :" -NoNewline -ForegroundColor DarkGray

  # Write posh-git status
  Write-VcsStatus

  $LastExitCode = $origLastExitCode
  "`n$('>' * ($nestedPromptLevel + 1)) "

  # Wakatime Heartbeat
  # https://github.com/wakatime/wakatime/issues/126#issuecomment-442892264
  <#
  if($wakatime) {
    wakatime --entity-type app --project Powershell;
  }
  return "=]"
  #>
}

# --------------------------------------------------------------------------------------------- #

<#
# Print a welcome message
# TODO: Update function name to use an approved verb
function Print-Welcome {
  # Write-Host
  $msg = "             _    _ _____ _     _____ ________  ___ _____
            | |  | |  ___| |   /  __ \  _  |  \/  ||  ___|
            | |  | | |__ | |   | /  \/ | | | .  . || |__
            | |/\| |  __|| |   | |   | | | | |\/| ||  __|
            \  /\  / |___| |___| \__/\ \_/ / |  | || |___
             \/  \/\____/\_____/\____/\___/\_|  |_/\____/

                      ________ _______ ________
                      ___  __ \___    |___  __/
                      __  /_/ /__  /| |__  /
                      _  ____/ _  ___ |_  /
                      /_/      /_/  |_|/_/
  "
  Write-Host $msg -ForegroundColor Green
}
Print-Welcome
#>

# EOF #
