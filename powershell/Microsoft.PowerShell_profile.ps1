# -------------------------------- #
#                                  #
# ------ POWERSHELL PROFILE ------ #
#                                  #
#          @author patevs          #
# -------------------------------- #

#C:\tools\cmdermini\icons\cmder.ico

# Import Posh-Git module
Import-Module -Name posh-git

# Start SSH agent
Start-SshAgent

# Setup alias'
# thefuck
$env:PYTHONIOENCODING = "utf-8"
Invoke-Expression "$(thefuck --alias)"
# git status
Set-Alias -Name gs -Value get-gitstatus
# list directory
Set-Alias -Name ls -Value get-dirlist -option AllScope -Force
function get-gitstatus { git status }
function get-dirlist { lsd -a1 }

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

  # Write date & time
  Write-Host $curPath -NoNewline -ForegroundColor Blue
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
  Write-Host " :" -NoNewline -ForegroundColor DarkGray
  
  # Write posh-git status
  Write-VcsStatus

  $LastExitCode = $origLastExitCode
  "`n$('>' * ($nestedPromptLevel + 1)) "
}

# Chocolatey profile
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) { 
#  Import-Module "$ChocolateyProfile" 
#}

# EOF
