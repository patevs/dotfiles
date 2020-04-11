# ----------- #
# aliases.ps1 #
# ----------- #

# Easier Navigation: .., ..., ...., ....., and ~
${function:~} = { Set-Location ~ }
# PoSh won't allow ${function:..} because of an invalid path error, so...
${function:Set-ParentLocation} = { Set-Location .. }; Set-Alias ".." Set-ParentLocation
${function:...} = { Set-Location ..\.. }
${function:....} = { Set-Location ..\..\.. }
${function:.....} = { Set-Location ..\..\..\.. }
${function:......} = { Set-Location ..\..\..\..\.. }

# Navigation Shortcuts
# $devPath = $env:USERPROFILE + "\git"
${function:dev} = { Set-Location ~\git }
${function:docs} = { Set-Location ~\Documents }
${function:dl} = { Set-Location ~\Downloads }
# $desktopPath = $env:USERPROFILE + "\desktop"
${function:dt} = { Set-Location ~\Desktop }
Set-Alias desktop -Value dt
Set-Alias desk -Value dt

# Oddly, Powershell doesn't have an inbuilt variable for the documents directory. So let's make one:
# From: https://stackoverflow.com/a/12949659
# $env:DOCUMENTS = [Environment]::GetFolderPath("mydocuments")

# --------------------------------------------------------------------------------------------- #

function open($file) {
  invoke-item $file
}

function explorer {
  explorer.exe .
}

# TODO: Create function to start FireFox
# function edge {
  # Old Edge
  # start microsoft-edge:
  #
  # New Chromioum Edge
#   & "${env:ProgramFiles(x86)}\Microsoft\Edge Dev\Application\msedge.exe"
# }

function settings {
  start-process ms-setttings:
}

# Truncate homedir to ~
# function limit-HomeDirectory($Path) {
#   $Path.Replace("$home", "~")
# }

# --------------------------------------------------------------------------------------------- #

function neofetch {
  bash C:\tools\neofetch\neofetch
}

function winfetch {
  C:\tools\winfetch\src\winfetch.ps1
}

# --------------------------------------------------------------------------------------------- #

# Missing Bash aliases
Set-Alias time Measure-Command

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

# Determine size of a file or total size of a directory
Set-Alias fs GetDiskUsage

# Empty the Recycle Bin on all drives
Set-Alias emptytrash EmptyRecycleBin

# Send an item to the Recycle Bin
# Set-Alias trash Remove-ItemSafely

# Cleanup old files all drives
# Set-Alias cleandisks CleanDisks

# Reload the shell
Set-Alias reload ReloadPowershell

# http://xkcd.com/530/
# Set-Alias mute Set-SoundMute
# Set-Alias unmute Set-SoundUnmute

# Update installed Ruby Gems, NPM, and their installed packages.
# Set-Alias update System-Update

# Set neovim as default vim
Set-Alias vim nvim

# EOF #
