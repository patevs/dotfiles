# -------------------------------- #
#                                  #
# ------ POWERSHELL PROFILE ------ #
#                                  #
#          @author patevs          #
# -------------------------------- #

# Import Posh-Git module
Import-Module -Name posh-git

# Start SSH agent
Start-SshAgent

# ------------------ #
# Set command alias' #
# ------------------ #

# Shutdown and reboot commands
Set-Alias -Name shut -Value shutdownSys
function shutdownSys {
  Write-Host "`nShutting down system...`n"
  shutdown /p
}

Set-Alias -Name restart -Value restartSys
Set-Alias -Name reboot -Value restartSys
function restartSys {
  Write-Host "`nRestarting system...`n"
  shutdown /r /t 0
}

# Print list of current directory contents
Set-Alias -Name ls -Value getDirList -option AllScope -Force
function getDirList {
  # Write-Host "`nDirectory Contents:`n"  -ForegroundColor Green
  lsd -a1
}

# Print file contents using bat
# Set-Alias -Name cat -Value getFileContents -option AllScope -Force
# function getFileContents { bat $args }

# Get help using tldr
# Set-Alias -Name help -Value getHelp
# function getHelp { tldr $args }

# Move to Desktop directory (~\desktop)
Set-Alias -Name desktop -Value moveDesktop
Set-Alias -Name desk -Value moveDesktop
function moveDesktop {
  $desktopPath = $env:USERPROFILE + "\desktop"
  Set-Location $desktopPath
}

# Move to development directory (~\desktop\git)
Set-Alias -Name dev -Value moveDev
function moveDev {
  $devPath = $env:USERPROFILE + "\desktop\git"
  Set-Location $devPath
  # Clear-Host
  getDirList
}

# --- #
# Git #
# --- #

# Use github client
Set-Alias -Name git -Value getGithubClient
function getGithubClient { hub $args }

# Print Git status
Set-Alias -Name gs -Value getGitStatus
function getGitStatus { git status }

# --- #
# NPM #
# --- #

Set-Alias -Name npl -Value getNpmLocals
Set-Alias -Name nplg -Value getNpmGlobals
function getNpmLocals {
  npm list --depth=0
}
function getNpmGlobals {
  npm list --global --depth=0
}

# ---------- #
# Chocolatey #
# ---------- #

Set-Alias -Name cll -Value getChocoInstalls
Set-Alias -Name clo -Value getChocoOutdated

function getChocoInstalls {
  choco list -l
}
function getChocoOutdated {
  # choco outdated
  choco upgrade all --noop
}

# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }

# thefuck (https://github.com/nvbn/thefuck)
# $env:PYTHONIOENCODING = "utf-8"
# Invoke-Expression "$(thefuck --alias)"

# -------------------------------------------------- #

# Print a welcome message
function printWelcome {
  Write-Host
  "             _    _ _____ _     _____ ________  ___ _____
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
}
printWelcome

# Test if running as administrator
# http://serverfault.com/questions/95431
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# -------------------------------------------------- #

# Customize the prompt
# https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
function prompt {
  # Write new line
  Write-Host
  $origLastExitCode = $LastExitCode

  # Test if admin
  if (Test-Administrator) {
    # if elevated
    Write-Host "(Elevated) " -NoNewline -ForegroundColor White
  }

  # write username@computername
  Write-Host "$env:USERNAME@" -NoNewline -ForegroundColor DarkYellow
  Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray

  # Write current path
  $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
  if ($curPath.ToLower().StartsWith($Home.ToLower())) {
    $curPath = "~" + $curPath.SubString($Home.Length)
  }

  # Write current path
  Write-Host $curPath -NoNewline -ForegroundColor Blue
  Write-Host " :" -NoNewline -ForegroundColor DarkGray

  # Write date & time
  # Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
  # Write-Host " :" -NoNewline -ForegroundColor DarkGray

  # Write posh-git status
  Write-VcsStatus

  $LastExitCode = $origLastExitCode
  "`n$('>' * ($nestedPromptLevel + 1)) "
}

# EOF #
