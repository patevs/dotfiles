# ------------- #
# functions.ps1 #
# ------------- #

# Write-Output "functions.ps1"

# Basic Commands
# ==============

function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }
function grep($regex, $dir) {
  if ( $dir ) {
    get-childitem $dir | select-string $regex
    return
  }
  $input | select-string $regex
}

# Common Editing needs
# function Edit-Hosts { Invoke-Expression "sudo $(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $env:windir\system32\drivers\etc\hosts" }
# function Edit-Profile { Invoke-Expression "$(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $profile" }

# Kinda like $EDITOR in nix
# TODO: check out edit-file from PSCX
# You may prefer eg 'subl' or 'code' or whatever else
function edit {
	& "code" -g @args
}

# Edit whole dir, so we can edit included files etc.
function edit-profile {
  edit $PSScriptRoot
}

# Open a given file
function open($file) {
  invoke-item $file
}

# Open Windows Explorer
function explorer {
  explorer.exe .
}

# Open Windows Settings
function settings {
  start-process ms-setttings:
}

# Truncate homedir to ~
# function limit-HomeDirectory($Path) {
#   $Path.Replace("$home", "~")
# }

# TODO: Create function to start FireFox
# function edge {
  # Old Edge
  # start microsoft-edge:
  #
  # New Chromioum Edge
#   & "${env:ProgramFiles(x86)}\Microsoft\Edge Dev\Application\msedge.exe"
# }


# Sudo
<#
function sudo() {
  if ($args.Length -eq 1) {
    start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1) {
    start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
}

# From https://github.com/Pscx/Pscx
function sudo(){
  Invoke-Elevated @args
}

function sudo {
  $file, [string]$arguments = $args;
  $psi = new-object System.Diagnostics.ProcessStartInfo $file;
  $psi.Arguments = $arguments;
  $psi.Verb = "runas";
  $psi.WorkingDirectory = get-location;
  [System.Diagnostics.Process]::Start($psi) >> $null
}

# https://stackoverflow.com/questions/7690994/running-a-command-as-administrator-using-powershell
function sudo {
  Start-Process powershell -Verb runAs
  if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
    exit
  }
}
#>

# ------------------------------------------------------------------------------------------------------- #

# PowerShell Utility Functions
# ============================

# Reload the Shell
function ReloadPowershell {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = "-nologo";
  [System.Diagnostics.Process]::Start($newProcess);
  exit
}
# function ReloadPowershell { & $profile }

# Set the current console title
# https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/powertip-change-the-powershell-console-title
function set-title([string]$newtitle) {
  $host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
}

# Reset the console colors
# https://stackoverflow.com/a/42624497
function reset-colors {
  [Console]::ResetColor()
}

# ------------------------------------------------------------------------------------------------------- #

# System Utility Functions
# ========================

# System Update - Update RubyGems, NPM, and their installed packages
<#
function SystemUpdate() {
  # Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
  Update-Module
  # Update-Help -Force
  gem update --system
  gem update
  npm install npm -g
  npm update -g
}
#>

# https://stackoverflow.com/a/7330368
function WindowsBuild {
  # [System.Environment]::OSVersion.Version
  [Environment]::OSVersion
}

# function get-serial-number {
#   Get-CimInstance -ClassName Win32_Bios | select-object serialnumber
# }

# function disable-windows-search {
# 	Set-Service wsearch -StartupType disabled
# 	stop-service wsearch
# }

# ------------------------------------------------------------------------------------------------------- #

# File System Functions
# =====================

# Create a new directory and enter it
function CreateAndSetDirectory([String] $path) {
  New-Item $path -ItemType Directory -ErrorAction SilentlyContinue
  Set-Location $path
}

# Empty the Recycle Bin on all drives
function EmptyRecycleBin {
  $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
  # $RecBin.Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
  $RecBin.Items() | ForEach-Object{Remove-Item $_.Path -Recurse -Confirm:$false}
}

# Cleanup all disks (Based on Registry Settings in `windows.ps1`)
function CleanDisks {
  Start-Process "$(Join-Path $env:WinDir 'system32\cleanmgr.exe')" -ArgumentList "/sagerun:6174" -Verb "runAs"
}

# ------------------------------------------------------------------------------------------------------- #

# Environment Functions
# =====================

# Reload the $env object from the registry
function RefreshEnvironment {
  $locations =
    'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
    'HKCU:\Environment'

  $locations | ForEach-Object {
    $k = Get-Item $_
    $k.GetValueNames() | ForEach-Object {
      $name  = $_
      $value = $k.GetValue($_)
      Set-Item -Path Env:\$name -Value $value
    }
  }

  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Set a permanent Environment variable, and reload it into $env
function Set-Environment([String] $variable, [String] $value) {
  Set-ItemProperty "HKCU:\Environment" $variable $value
  # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
  #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
  Invoke-Expression "`$env:${variable} = `"$value`""
}

# Get Environment Path
function Get-Path {
	($Env:Path).Split(";")
}

# Add a folder to $env:Path
function PrependEnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
function AppendEnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }

# function PrependEnvPathIfExists([String]$path) { if (Test-Path $path) { PrependEnvPath $path } }
# function AppendEnvPathIfExists([String]$path) { if (Test-Path $path) { AppendEnvPath $path } }

# ------------------------------------------------------------------------------------------------------- #

# Git Functions
# =============

# Print Git Status
function gs {
  # Print-Green-Underline "Git Status:"
  Write-Output "`n Git Status:`n"
  git status
}

# Print git status using g3l
function gss {
  # Fetch git remote
  # Print-Green-Underline "Git Remotes:"
  Write-Output "`n Git Remotes:`n"
  git remote -v
  # Print-Green-Underline "Git Status:"
  Write-Output "`n Git Status:`n"
  # TODO: Replace g3l with git-branch-status
  # g3l --status
  # Write-Output "" # new line
  git status
}

# ------------------------------------------------------------------------------------------------------- #

# NodeJS & NPM Functions
# ======================

# Print list of local NPM dependencies
function npl {
  # Print-Green-Underline "Local NPM Dependencies:"
  Write-Output "`n Local NPM Dependencies: `n"
  npm list --depth=0
}

# Print list of global NPM dependencies
function nplg {
  # Print-Green-Underline "Global NPM Dependencies:"
  Write-Output "`n Global NPM Dependencies: `n"
  npm list --global --depth=0
}

# ------------------------------------------------------------------------------------------------------- #

# Chocolatey Functions
# ====================

# Print list of local chocolatey installations
function cll {
  # Print-Green-Underline "Local Chocolatey Installations:"
  Write-Output "`n Local Chocolatey Installations:`n"
  choco list -l
}

# Print list of outdated chocolatey installations
function clo {
  # Print-Green-Underline "Outdated Chocolatey Installations:"
  Write-Output "`n Outdated Chocolatey Installations:`n"
  choco upgrade all --noop
}

# ------------------------------------------------------------------------------------------------------- #

# EOF #
