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

# System Utility Aliases
# ======================

# Shutdown System
Set-Alias -Name shut -Value shutdown

# Restart System
Set-Alias -Name reboot -Value restart

# System information tools
${function:neofetch} = { bash C:\tools\neofetch\neofetch }
${function:winfetch} = { C:\tools\winfetch\src\winfetch.ps1 }

# ------------------------------------------------------------------------------------------------------- #

# Unix-like Aliases
# =================

# Missing Bash aliases
Set-Alias time Measure-Command

# --------------------------------------------------------------------------------------------- #

# Git & GitHub Aliases
# ====================

# Git Multi Status
${function:mgs} = {
  bash C:\tools\multi-git-status\mgitstatus
}

# Favour GitHub's hub client over vanilla git
if (Get-Command hub -ErrorAction SilentlyContinue) { Set-Alias git hub }

# --------------------------------------------------------------------------------------------- #

# Correct PowerShell Aliases if tools are available (aliases win if set)
# WGet: Use `wget.exe` if available
<#
if (Get-Command wget.exe -ErrorAction SilentlyContinue | Test-Path) {
  rm alias:wget -ErrorAction SilentlyContinue
}
#>

# Directory Listing: Use `ls.exe` if available
<#
if (Get-Command ls.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:ls -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:ls} = { ls.exe --color @args }
    # List all files in long format
    ${function:l} = { ls -lF @args }
    # List all files in long format, including hidden files
    ${function:la} = { ls -laF @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
} else {
    # List all files, including hidden files
    ${function:la} = { ls -Force @args }
    # List only directories
    ${function:lsd} = { Get-ChildItem -Directory -Force @args }
}
#>

# curl: Use `curl.exe` if available
<#
if (Get-Command curl.exe -ErrorAction SilentlyContinue | Test-Path) {
    rm alias:curl -ErrorAction SilentlyContinue
    # Set `ls` to call `ls.exe` and always use --color
    ${function:curl} = { curl.exe @args }
    # Gzip-enabled `curl`
    ${function:gurl} = { curl --compressed @args }
} else {
    # Gzip-enabled `curl`
    ${function:gurl} = { curl -TransferEncoding GZip }
}
#>

# --------------------------------------------------------------------------------------------- #

# Create a new directory and enter it
Set-Alias mkd CreateAndSetDirectory

# Empty the Recycle Bin on all drives
Set-Alias emptytrash EmptyRecycleBin

# Send an item to the Recycle Bin
# Set-Alias trash Remove-ItemSafely

# Cleanup old files all drives
# Set-Alias cleandisks CleanDisks

# Reload the shell
Set-Alias reload ReloadPowershell

# Update installed Ruby Gems, NPM, and their installed packages.
# Set-Alias update System-Update

# Set neovim as default vim
Set-Alias vim nvim

# EOF #
