<#
.SYNOPSIS
  Neovim configuration install script.

.DESCRIPTION
  Copies init.vim to:

    "%USERPROFILE%\APPDATA\Local\nvim\init.vim"

.NOTES
  Version:        1.1
  Author:         PatEvs (github.com/patevs)
  Last Modified:  23/04/2020 - April 19th 2020

.EXAMPLE
  .\bootstrap.ps1
#>

# TODO: Detect OS type and ensure running on windows

# -------------------------------- [Declarations] ------------------------------- #

# Destination directory location
$destinationDir = "$env:LOCALAPPDATA\nvim"

# --------------------------------- [Execution] --------------------------------- #

# Install VimPlug
New-Item ~\AppData\Local\nvim\autoload -ItemType Directory -Force -ErrorAction SilentlyContinue
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\AppData\Local\nvim\autoload\plug.vim"
  )
)

# Create destination directory
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy init.vim to destination
Copy-Item -Path ./init.vim -Destination $destinationDir

Remove-Variable destinationDir

# Install neovim plugins
Invoke-Expression "nvim +PlugInstall"

# ------------------------------------ [END] ------------------------------------ #
