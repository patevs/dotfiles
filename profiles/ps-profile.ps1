# -------------------------------- #
#                                  #
# ------ POWERSHELL PROFILE ------ #
#                                  #
#          @author patevs          #
# -------------------------------- #

# ---------------- #
# Helper Functions #
# ---------------- #

function reload-profile {
	& $profile
}

function print-path {
	($Env:Path).Split(";")
}

# Print PowerShell version
function ps-version {
  $PSVersionTable.PSVersion
}

# Print list of installed PowerShell modules
function ps-modules {
  Get-InstalledModule
}

# Check if a given command exists
# https://stackoverflow.com/questions/3919798/how-to-check-if-a-cmdlet-exists-in-powershell-at-runtime-via-script
function Check-Command($cmdname) {
  # return [bool](Get-Command -Name $cmdname -ea 0)
  return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# Check if a given PowerShell module is installed
# https://stackoverflow.com/questions/28740320/how-do-i-check-if-a-powershell-module-is-installed
function Check-Module($modname){
  return [bool](Get-Module -ListAvailable -Name $modname)
}

# Test if running as administrator
# http://serverfault.com/questions/95431
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

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

#################
# CONFIGURATION #
#################

# Increase history
$MaximumHistoryCount = 10000

# Produce UTF-8 by default
$PSDefaultParameterValues["Out-File:Encoding"]="utf8"

# Import posh-git module if installed
if (Check-Module "posh-git") { Import-Module -Name posh-git }

# Import Terminal-Icons module if installed
# if (Check-Module "Terminal-Icons") { Import-Module -Name Terminal-Icons }

# Import Get-ChildItemColor module if installed
# if (Check-Module "Get-ChildItemColor") { Import-Module -Name Get-ChildItemColor }

# Start SSH agent
Start-SshAgent

# ------------------ #
# Unix-like Commands #
# ------------------ #

function grep($regex, $dir) {
	if ( $dir ) {
		ls $dir | select-string $regex
		return
	}
	$input | select-string $regex
}

function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

function touch($file) {
	"" | Out-File $file -Encoding ASCII
}

# --------------- #
# Command Aliases #
# --------------- #

# function pull () { & get pull $args }
# function checkout () { & git checkout $args }

# del alias:gc -Force
# del alias:gp -Force

# Set-Alias -Name gc -Value checkout
# Set-Alias -Name gp -Value pull

# -------------------------------- #
# System & Utility Related Aliases #
# -------------------------------- #

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

# ----------------------------------------------- #

# Move to Desktop Directory (~\desktop)
function moveDesktop {
  $desktopPath = $env:USERPROFILE + "\desktop"
  Set-Location $desktopPath
}
Set-Alias -Name desktop -Value moveDesktop
Set-Alias -Name desk -Value moveDesktop

# Move to Development Directory (~\desktop\git)
function moveDev {
  $devPath = $env:USERPROFILE + "\desktop\git"
  Set-Location $devPath
}
Set-Alias -Name dev -Value moveDev

# ----------------------------------------------- #

# Print list of current directory contents
# Set-Alias l Get-ChildItem -option AllScope
# Set-Alias ls Get-ChildItemColorFormatWide -option AllScope

# Print short list of current directory contents
function getDir {
  Write-Host "`nDirectory Contents:`n"  -ForegroundColor Green
  # Favour lsd over default dir command
  if (Check-Command lsd) { lsd } 
  else { dir }
}
Set-Alias -Name l -Value getDir

# Print list of current directory contents
function getDirList {
  Write-Host "`nDirectory Contents:`n"  -ForegroundColor Green
  # Favour lsd over default dir command
  if (Check-Command lsd) { lsd -a1 } 
  else { dir }
}
Set-Alias -Name ls -Value getDirList -option AllScope -Force
Set-Alias -Name ll -Value getDirList

# Print long list of current directory contents
function getDirListLong {
  Write-Host "`nDirectory Contents:`n"  -ForegroundColor Green
  # Favour lsd over default dir command
  if (Check-Command lsd) { lsd -al } 
  else { dir }
}
Set-Alias -Name lll -Value getDirListLong

# ----------------------------------------------- #

# Print file contents using bat
# Set-Alias -Name cat -Value getFileContents -option AllScope -Force
# function getFileContents { bat $args }

# Get help using tldr
# Set-Alias -Name help -Value getHelp
# function getHelp { tldr $args }

# ---------------------------- #
# Git & GitHub Related Aliases #
# ---------------------------- #

# Use GitHub's hub Client in favor of git
function getGithubClient { 
  # Check hub command exists
  if (Check-Command hub){
    hub $args
  } else {
    Write-Host "`nhub installation could not be found!" -ForegroundColor Red
    # TODO: Check if git command exists
    # if (Check-Command git) {
    #   git $args
    # } else {
    #   Write-Host "`nNeither git or hub Installations Could Not Be Found!" -ForegroundColor Red
    # } 
  }
}
Set-Alias -Name git -Value getGithubClient

# Print Git Status
function getGitStatus { 
  # Check current directory is a git repository i.e. contains .git folder
  # if (Test-Path .git) {
  # Check git command exists
  if (Check-Command git){
    Write-Host "`nGit Status:`n"  -ForegroundColor Green
    # Check g3l command exists
    if (Check-Command g3l) {
      g3l --status
      Write-Host "" # new line
    }
    git status
  } else {
    Write-Host "`ngit installation could not be found!" -ForegroundColor Red
  }
  # } else {
  #   Write-Host "`nCurrent directory is not a git repository!" -ForegroundColor Red
  # }
}
Set-Alias -Name gs -Value getGitStatus

# ------------------- #
# NPM Related Aliases #
# ------------------- #

# Print list of local NPM dependencies
function getNpmLocals {
  # Check node_modules directory exists
  if (Test-Path node_modules){
    # Check npm command exists
    if (Check-Command npm){
      Write-Host "`nLocal NPM Dependencies:`n" -ForegroundColor Green
      npm list --depth=0 
    } else {
      Write-Host "`nnpm installation could not be found!" -ForegroundColor Red
    }
  } else {
    Write-Host "`nnode_modules folder does not exist in current directory!" -ForegroundColor Red
  }
}
Set-Alias -Name npl -Value getNpmLocals

# Print list of global NPM dependencies
function getNpmGlobals {
  # Check npm command exists
  if (Check-Command npm){
    Write-Host "`nGlobal NPM Dependencies:`n" -ForegroundColor Green
    npm list --global --depth=0 
  } else {
    Write-Host "`nnpm installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name nplg -Value getNpmGlobals

# -------------------------- #
# Chocolatey Related Aliases #
# -------------------------- #

# Print list of local chocolatey installations
function getChocoInstalls { 
  # Check choco command exists
  if (Check-Command choco) {
    Write-Host "`nLocal Chocolatey Installations:`n" -ForegroundColor Green
    choco list -l 
  } else {
    Write-Host "`nchoco installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name cll -Value getChocoInstalls

# Print list of outdated chocolatey installations
function getChocoOutdated { 
  # Check choco command exists
  if (Check-Command choco) {
    Write-Host "`nOutdated Chocolatey Installations:`n" -ForegroundColor Green
    choco upgrade all --noop 
  } else {
    Write-Host "`nchoco installation could not be found!" -ForegroundColor Red
  } 
}
Set-Alias -Name clo -Value getChocoOutdated

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# --------------------------- #
# Customize PowerShell Prompt #
# --------------------------- #

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
  Write-Host "$env:USERNAME@" -NoNewline -ForegroundColor DarkYellow
  Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray

  # Build current path
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

