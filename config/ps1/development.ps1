# -------------------------- #
# config/ps1/development.ps1 #
# -------------------------- #

# PowerShell $PROFILE development settings
# ~\Documents\WindowsPowerShell\development.ps1

# --------------------------------------------------------------------------- #

# RethinkDB and Python (needed for the Python rethinkdb dump tool)
# Add-PathVariable "${env:ProgramFiles}\rethinkdb"
# Add-PathVariable "${env:ProgramFiles}\Python"
# pip is in the scripts dir
# Add-PathVariable "${env:ProgramFiles}\Python\Scripts"

# mongoDB
# Add-PathVariable 'C:\Program Files\MongoDB\Server\4.0\bin'

# git
# Add-PathVariable "${env:ProgramFiles}/git/bin"
# To use git supplied by SourceTree instead of the 'git for Windows' version
# Add-PathVariable "${env:LOCALAPPDATA}\Atlassian\SourceTree\git_local\bin"
# Add-PathVariable "${env:ProgramFiles}\Git\bin"

# vscode
# Add-PathVariable "${env:LOCALAPPDATA}\Programs\Microsoft VS Code\bin"

# Python (also needed for the Python rethinkdb dump tool)
# Add-PathVariable "${env:ProgramFiles}\Python"
# pip is in the scripts dir
# Add-PathVariable "${env:ProgramFiles}\Python\Scripts"

# Tab completion for git (also modified prompt, which I dislike, so disabled)
# Install-Module posh-git

# Load posh-git example profile
# . 'C:\Users\mike\Documents\WindowsPowerShell\Modules\posh-git\profile.example.ps1'

# function gg {
	# Replace 'file:linenumber:content' with 'file:linenumber content'
	# so you can just click the file:linenumber and go straight there.
# 	& git grep -n -i @args | foreach-object { $_ -replace '(\d+):','$1 ' }
# }

# function get-git-ignored {
# 	git ls-files . --ignored --exclude-standard --others
# }

# function get-git-untracked {
# 	git ls-files . --exclude-standard --others
# }

# function fork {
	# Fork requires an absolute path https://github.com/ForkIssues/TrackerWin/issues/416#issuecomment-527067604
# 	$absolutePath = resolve-path .
# 	& ${env:LOCALAPPDATA}\Fork\Fork.exe $absolutePath
# }

# --------------------------------------------------------------------------- #

# Check if a given command exists
# https://stackoverflow.com/questions/3919798/how-to-check-if-a-cmdlet-exists-in-powershell-at-runtime-via-script
# TODO: Remove this function as it exists in ./defaults.ps1
function Check-Command($cmdname) {
  # return [bool](Get-Command -Name $cmdname -ea 0)
  return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# --------------------------------------------------------------------------- #

# ------------------- #
# Text Editor Aliases #
# ------------------- #

# For git rebasing
# --wait required, see https://github.com/Microsoft/vscode/issues/23219
# $env:EDITOR = 'code --wait'

# Kinda like $EDITOR in nix
# TODO: check out edit-file from PSCX
# You may prefer eg 'subl' or 'code' or whatever else
function edit {
	& "code" -g @args
}

# I used to run Sublime so occasionally my fingers type it
# function subl {
	# 	& "$env:ProgramFiles\Sublime Text 3\subl.exe" @args
# 	write-output "Type 'edit' instead"
# }

# --------------------------------------------------------------------------- #

# Print file contents using bat
# Set-Alias -Name cat -Value getFileContents -option AllScope -Force
# function getFileContents { bat $args }

# Get help using tldr
# Set-Alias -Name help -Value getHelp
# function getHelp { tldr $args }

# --------------------------------------------------------------------------- #

# ------------------------ #
# Logging Helper Functions #
# ------------------------ #

# Print a given string formatted colored green and underlined
function Print-Green-Underline ($str) {
  Write-Host "`n$([char]27)[4m$str$([char]27)[24m`n" -ForegroundColor Green
}

# --------------------------------------------------------------------------- #

# ---------------------------- #
# Git & GitHub Related Aliases #
# ---------------------------- #

# Git Multi Status
function getGitMultiStatus {
  # Invoke-Expression
  bash C:\tools\multi-git-status\mgitstatus
}
Set-Alias -Name mgs -Value getGitMultiStatus

# Use GitHub's hub Client in favor of git
if (Check-Command hub){ Set-Alias git hub }

# Print Git Status
function getGitStatus {
  # Check git command exists
  if (Check-Command git){
    # Write-Host "`n Git Status:`n"  -ForegroundColor Green
    Print-Green-Underline "Git Status:"
    git status
  } else {
    Write-Host "`n Git installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name gs -Value getGitStatus


# Print git status using g3l
function getG3lStatus {
  # Check git command exists
  if (Check-Command git){
    # Fetch git remote
    # Write-Host "`n Git Remotes:`n"  -ForegroundColor Green
    Print-Green-Underline "Git Remotes:"
    git remote -v
    # Write-Host "`n Git Status:`n"  -ForegroundColor Green
    Print-Green-Underline "Git Status:"
    # Check g3l command exists
    if (Check-Command g3l) {
      g3l --status
      Write-Host "" # new line
    }
    git status
  } else {
    Write-Host "`n Git installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name gss -Value getG3lStatus

# --------------------------------------------------------------------------- #

# ------------------- #
# NPM Related Aliases #
# ------------------- #

# Print list of local NPM dependencies
function getNpmLocals {
  # Check node_modules directory exists
  if (Test-Path node_modules){
    # Check npm command exists
    if (Check-Command npm){
      # Write-Host "`n Local NPM Dependencies:`n" -ForegroundColor Green
      Print-Green-Underline "Local NPM Dependencies:"
      npm list --depth=0
    } else {
      Write-Host "`n NPM installation could not be found!" -ForegroundColor Red
    }
  } else {
    Write-Host "`n node_modules folder does not exist in current directory!" -ForegroundColor Red
  }
}
Set-Alias -Name npl -Value getNpmLocals

# Print list of global NPM dependencies
function getNpmGlobals {
  # Check npm command exists
  if (Check-Command npm){
    # Write-Host "`n Global NPM Dependencies:`n" -ForegroundColor Green
    Print-Green-Underline "Global NPM Dependencies:"
    npm list --global --depth=0
  } else {
    Write-Host "`n NPM installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name nplg -Value getNpmGlobals

# --------------------------------------------------------------------------- #

# -------------------------- #
# Chocolatey Related Aliases #
# -------------------------- #

# Print list of local chocolatey installations
function getChocoInstalls {
  # Check choco command exists
  if (Check-Command choco) {
    # Write-Host "`n Local Chocolatey Installations:`n" -ForegroundColor Green
    Print-Green-Underline "Local Chocolatey Installations:"
    choco list -l
  } else {
    Write-Host "`n Chocolatey installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name cll -Value getChocoInstalls

# Print list of outdated chocolatey installations
function getChocoOutdated {
  # Check choco command exists
  if (Check-Command choco) {
    # Write-Host "`n Outdated Chocolatey Installations:`n" -ForegroundColor Green
    Print-Green-Underline "Outdated Chocolatey Installations:"
    choco upgrade all --noop
  } else {
    Write-Host "`n Chocolatey installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name clo -Value getChocoOutdated

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile" -Force
}

# Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1” -Force

# --------------------------------------------------------------------------- #

# --------------------- #
# Scoop Related Aliases #
#---------------------- #

try {
  Import-Module -ErrorAction Stop "$($(Get-Item $(Get-Command -ErrorAction Stop scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
} catch { }


# EOF #

