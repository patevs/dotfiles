# ----------- #
# aliases.ps1 #
# ----------- #

# Write-Output "aliases.ps1"

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
${function:dev} = { Set-Location ~\code }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
${function:dt} = { Set-Location ~\Desktop }

Set-Alias -Name desk -Value dt
Set-Alias -Name desktop -Value dt

# Oddly, Powershell doesn't have an inbuilt variable for the documents directory. So let's make one:
# From: https://stackoverflow.com/a/12949659
# $env:DOCUMENTS = [Environment]::GetFolderPath("mydocuments")

# ------------------------------------------------------------------------------------------------------- #

# PowerShell Utility Aliases
# ==========================

# Reload the shell
Set-Alias -Name reload -Value ReloadPowershell

# Get current PowerShell version
${function:version} = { $PSVersionTable.PSVersion }

# Get installed PowerShell modules
${function:modules} = { Get-Module -ListAvailable }

# Ensure `thefuck` is installed
if (which thefuck){
  # Correct the previous command using `thefuck`
  $env:PYTHONIOENCODING="utf-8"
  Invoke-Expression "$(thefuck --alias)"
  # Unset PYTHONIOENCODING environment variable
  Remove-Item env:PYTHONIOENCODING
}

# ------------------------------------------------------------------------------------------------------- #

# System Utility Aliases
# ======================

# System Information
${function:neofetch} = { bash C:\bin\neofetch\neofetch }

# Shutdown System
${function:shutdown} = { Stop-Computer -ComputerName localhost }
Set-Alias -Name shut -Value shutdown

# Restart System
${function:restart} = { Restart-Computer }
Set-Alias -Name reboot -Value restart

# Create a new directory and enter it
Set-Alias -Name mkd -Value CreateAndSetDirectory

# Remove a given item
Set-Alias -Name del -Value RemoveItem -option AllScope -Force

# Send an item to the Recycle Bin
Set-Alias -Name trash -Value Remove-ItemSafely

# Empty the Recycle Bin on all drives
Set-Alias -Name emptytrash -Value EmptyRecycleBin

# Cleanup old files all drives
Set-Alias -Name cleandisks -Value CleanDisks

# Reload the shell
Set-Alias -Name reload -Value ReloadPowershell

# Update installed Ruby Gems, NPM, and their installed packages.
# Set-Alias -Name update -Value SystemUpdate

# Set neovim as default vim
Set-Alias -Name vim -Value nvim

# ------------------------------------------------------------------------------------------------------- #

# Unix-like Aliases
# =================

# Git-bash shell
Set-Alias -Name bash -Value "C:\Program Files\Git\bin\bash.exe"

# Directory Listing: Use `lsd.exe` if available
if (which lsd) {
  # List directory contents in short format
  ${function:l} = { Write-Host ""; lsd --color always --icon always @args }
  # List directory contents
  ${function:ll} = { Write-Host ""; lsd -A1 --color always --icon always @args }
  # List directory contents in long format
  ${function:lll} = { Write-Host ""; lsd -al --color always --icon always @args }
  # List directory tree
  ${function:lst} = { Write-Host ""; lsd --tree --color always --icon always --ignore-glob "node_modules"  @args }
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
Set-Alias -Name time -Value Measure-Command

# --------------------------------------------------------------------------------------------- #

# Git & GitHub Aliases
# ====================

# Git clone and cd
Set-Alias -Name gcd -Value Invoke-GitClone

# ls with git status
${function:lsg} = { Write-Host ""; bash C:\bin\ls-with-git-status\lsg }
# Set-Alias -Name ls -Value lsg -option AllScope -Force

# Git branch status
${function:gbs} = { Write-Host ""; bash C:\bin\git-branch-status\git-branch-status -l }

# Git Multi Status
${function:mgs} = { bash C:\bin\multi-git-status\mgitstatus --depth=0 }

# Favour GitHub's hub client over vanilla git
if (Get-Command hub -ErrorAction SilentlyContinue) { Set-Alias -Name git -Value hub }

# --------------------------------------------------------------------------------------------- #

# EOF #
