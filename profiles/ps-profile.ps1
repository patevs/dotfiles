# -------------------------------- #
#                                  #
# ------ POWERSHELL PROFILE ------ #
#                                  #
#          @author patevs          #
# -------------------------------- #

# Increase history
$MaximumHistoryCount = 10000

# Produce UTF-8 by default
$PSDefaultParameterValues["Out-File:Encoding"]="utf8"

# Import Posh-Git module
# Import-Module -Name posh-git

# Start SSH agent
# Start-SshAgent

# ---------------- #
# Helper Functions #
# ---------------- #

function reload-profile {
	& $profile
}

function print-path {
	($Env:Path).Split(";")
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

function sudo {
	$file, [string]$arguments = $args;
	$psi = new-object System.Diagnostics.ProcessStartInfo $file;
	$psi.Arguments = $arguments;
	$psi.Verb = "runas";
	$psi.WorkingDirectory = get-location;
	[System.Diagnostics.Process]::Start($psi) >> $null
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

# ---------------------- #
# System Related Aliases #
# ---------------------- #

# Shutdown System
function shutdownSys {
  Write-Host "`nShutting down system...`n"
  shutdown /p
}

# Restart System
function restartSys {
  Write-Host "`nRestarting system...`n"
  shutdown /r /t 0
}

Set-Alias -Name shut -Value shutdownSys
Set-Alias -Name restart -Value restartSys
Set-Alias -Name reboot -Value restartSys

# Move to Desktop Directory (~\desktop)
function moveDesktop {
  $desktopPath = $env:USERPROFILE + "\desktop"
  Set-Location $desktopPath
}

# Move to Development Directory (~\desktop\git)
function moveDev {
  $devPath = $env:USERPROFILE + "\desktop\git"
  Set-Location $devPath
}

Set-Alias -Name desktop -Value moveDesktop
Set-Alias -Name desk -Value moveDesktop
Set-Alias -Name dev -Value moveDev

# ---------------------------- #
# Git & GitHub Related Aliases #
# ---------------------------- #

# TODO: Ensure hub command exists
# Use GitHub's hub Client in favor of git
# Set-Alias -Name git -Value getGithubClient
# function getGithubClient { hub $args }

# TODO: Ensure git command exists
# TODO: Check for presence of g3l command
# Print Git Status
# Set-Alias -Name gs -Value getGitStatus
# function getGitStatus { git status }

# ------------------- #
# NPM Related Aliases #
# ------------------- #

# TODO: Ensure NPM command exists
# function getNpmLocals { npm list --depth=0 }
# function getNpmGlobals { npm list --global --depth=0 }
# Set-Alias -Name npl -Value getNpmLocals
# Set-Alias -Name nplg -Value getNpmGlobals

# -------------------------- #
# Chocolatey Related Aliases #
# -------------------------- #

# Set-Alias -Name cll -Value getChocoInstalls
# Set-Alias -Name clo -Value getChocoOutdated
# function getChocoInstalls { choco list -l }
# function getChocoOutdated { choco upgrade all --noop }

# Chocolatey profile
# $ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
# if (Test-Path($ChocolateyProfile)) {
#   Import-Module "$ChocolateyProfile"
# }

# --------------------------- #
# Customize PowerShell Prompt #
# --------------------------- #

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
  # Write-VcsStatus

  $LastExitCode = $origLastExitCode
  "`n$('>' * ($nestedPromptLevel + 1)) "
}


# EOF #

