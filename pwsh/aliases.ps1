# ----------- #
# aliases.ps1 #
# ----------- #

Write-Output "aliases.ps1"

# Navigation Aliases
# ==================

# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

# Navigation Shortcuts
${function:dev} = { Set-Location ~\git }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
${function:dt} = { Set-Location ~\Desktop }

Set-Alias desktop -Value dt
Set-Alias desk -Value dt

# Oddly, Powershell doesn't have an inbuilt variable for the documents directory. So let's make one:
# From: https://stackoverflow.com/a/12949659
# $env:DOCUMENTS = [Environment]::GetFolderPath("mydocuments")

# ------------------------------------------------------------------------------------------------------- #

# PowerShell Utility Aliases
# ==========================

# Reload the shell
Set-Alias -Name reload -Value ReloadPowershell

# ------------------------------------------------------------------------------------------------------- #

# System Utility Aliases
# ======================

# System information tools
${function:neofetch} = { bash C:\tools\neofetch\neofetch }
${function:winfetch} = { C:\tools\winfetch\src\winfetch.ps1 }

# Shutdown System
Set-Alias -Name shut -Value shutdown

# Restart System
Set-Alias -Name reboot -Value restart

# Create a new directory and enter it
Set-Alias mkd CreateAndSetDirectory

# Empty the Recycle Bin on all drives
Set-Alias emptytrash EmptyRecycleBin

# Send an item to the Recycle Bin
Set-Alias trash Remove-ItemSafely

# Cleanup old files all drives
Set-Alias cleandisks CleanDisks

# Reload the shell
Set-Alias reload ReloadPowershell

# Update installed Ruby Gems, NPM, and their installed packages.
# Set-Alias update System-Update

# Set neovim as default vim
Set-Alias vim nvim

# ------------------------------------------------------------------------------------------------------- #

# Unix-like Aliases
# =================

# Directory Listing: Use `lsd.exe` if available
if (Get-Command lsd -ErrorAction SilentlyContinue | Test-Path) {
  # List directory contents in short format
  ${function:l} = { lsd --color always --icon always @args }
  # List directory contents
  ${function:ll} = { lsd -A1 --color always --icon always @args }
  # List directory contents in long format
  ${function:lll} = { lsd -al --color always --icon always @args }
  # List directory tree
  ${function:lst} = { lsd --tree --color always --icon always @args }
} else {
  ${function:l} = { Get-ChildItem }
  ${function:ll} = { Get-ChildItem | Format-Wide }
  ${function:lll} = { Get-ChildItem | Format-List }
  ${function:lst} = { tree }
}
Set-Alias -Name ls -Value ll -option AllScope -Force

# Favour ripgrep over grep if installed
if (Get-Command rg -ErrorAction SilentlyContinue) { Set-Alias -Name grep -Value rg }

# Measure the time taken for a command to execute
Set-Alias time Measure-Command

# --------------------------------------------------------------------------------------------- #

# Git & GitHub Aliases
# ====================

# Git Multi Status
${function:mgs} = { bash C:\tools\multi-git-status\mgitstatus }

# Favour GitHub's hub client over vanilla git
if (Get-Command hub -ErrorAction SilentlyContinue) { Set-Alias git hub }

# --------------------------------------------------------------------------------------------- #

# EOF #
