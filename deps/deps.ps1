# -------- #
# deps.ps1 #
# -------- #

# Check to see if we are currently running "as Administrator"
# TODO: Add function to check if elevated
if (!(Test-Elevated)) {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = $myInvocation.MyCommand.Definition;
  $newProcess.Verb = "runas";
  [System.Diagnostics.Process]::Start($newProcess);

  exit
}

# ------------------------------------------------------------------------------------------------------- #

# Update Help for Modules
# =======================

# Write-Host "Updating Help..." -ForegroundColor "Yellow"

# Update-Help -Force
# Update-Help -UICulture en-US

# ------------------------------------------------------------------------------------------------------- #

# Package Providers
# =================

Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"

# NuGet
Get-PackageProvider NuGet -Force | Out-Null

# Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
# Import-PackageProvider NuGet -Force

# Set PSGallery as a trusted repository
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Chocolatey Provider is not ready yet. Use normal Chocolatey
# Get-PackageProvider Chocolatey -Force
# Set-PackageSource -Name chocolatey -Trusted

# ------------------------------------------------------------------------------------------------------- #

# PowerShell Modules
# ==================

Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"

Install-Module -Name PackageManagement -Force
# Install-Module -Name PowerShellGet -Force
Install-Module -Name PowerShellGet -Force -SkipPublisherCheck
# PS 6+
# Install-Module -Name Pester -Scope CurrentUser
# PS 5.1
# Install-Module -Name Pester -Force -SkipPublisherCheck -Scope CurrentUser
# Install-Module -Name Configuration

Install-Module -Name PSReadLine -Scope CurrentUser -Force
Install-Module -Name PSWindowsUpdate -Scope CurrentUser -Force
# Install-Module -Name PSWriteColor -Scope CurrentUser -Force
# Install-Module -Name PSKoans -Scope CurrentUser -Force

Install-Module -Name npm-completion -Scope CurrentUser -Force
Install-Module -Name posh-cargo -Scope CurrentUser -Force -AllowClobber
# Install-Module -Name posh-cli -Scope CurrentUser -Force
Install-Module -Name posh-dotnet -Scope CurrentUser -Force
Install-Module -Name posh-git -Scope CurrentUser -Force -AllowClobber
# Install-Module -Name posh-npm -Scope CurrentUser -Force
Install-Module -Name scoop-completion -Scope CurrentUser -Force -AllowClobber
Install-Module -Name yarn-completion -Scope CurrentUser -Force

# Install-Module Terminal-Icons -Scope CurrentUser -Force
# Install-Module Get-ChildItemColor -Scope CurrentUser -Force

# ------------------------------------------------------------------------------------------------------- #

# Chocolatey
# ==========

Write-Host "Installing Chocolatey..." -ForegroundColor "Yellow"

# Verify chocolatey is installed
if (which cinst) {
  # Update chocolatey
  choco upgrade chocolatey -y
} else {
  # Install chocolatey
  Invoke-Expression (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
  Refresh-Environment
  choco feature enable -n=allowGlobalConfirmation
}

<#
if ((which cinst) -eq $null) {
  iex (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
  Refresh-Environment
  choco feature enable -n=allowGlobalConfirmation
}
#>

# System and Development Tools
choco install 7zip.install
# choco install atom                --limit-output; <# pin; evergreen #> choco pin add --name Atom                --limit-output
# choco install curl                --limit-output
# choco install Fiddler             --limit-output
# choco install genymotion
choco install git.install
choco install jdk8
# choco install nuget.commandline   --limit-output
# choco install nvm.portable        --limit-output
choco install reactotron
# choco install rsvg-convert
# choco install visualstudio2019community
choco install visualstudio2019buildtools
# TODO: Install vscode extensions
choco install vscode.install
# choco install webpi               --limit-output
# choco install winmerge            --limit-output

# Fonts
# choco install sourcecodepro       --limit-output

# Web Browsers
choco install Firefox
# choco install Firefox             --limit-output; <# pin; evergreen #> choco pin add --name Firefox             --limit-output
choco install GoogleChrome
# choco install GoogleChrome        --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome        --limit-output

# Applications
choco install gimp
choco install qbittorrent
choco install revo-uninstaller
choco install spotify
choco install vlc

RefreshEnvironment

# ------------------------------------------------------------------------------------------------------- #

# Scoop
# =====

# TODO: ENsure git is installed

Write-Host "Installing Scoop..." -ForegroundColor "Yellow"

Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Verify scoop is installed
if (Get-Command scoop) {
  # Update scoop
  Invoke-Expression "scoop update"
} else {
  # Install scoop
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
  # Add scoop buckets
  Write-Host "Adding Scoop Buckets..." -ForegroundColor "Yellow"
  Invoke-Expression "scoop bucket add extras"
  Invoke-Expression "scoop bucket add versions"
  Invoke-Expression "scoop bucket add nonportable"
  Invoke-Expression "scoop bucket add nerd-fonts"
  Invoke-Expression "scoop bucket add scoop-bucket https://github.com/Rigellute/scoop-bucket"
  Invoke-Expression "scoop bucket add scoop-completion https://github.com/Moeologist/scoop-completion"
}

# Fix for scoop-completion error: https://github.com/lukesampson/scoop/issues/3528
Invoke-Expression "scoop config alias @{}"

# Install scoop packages
Write-Host "Installing Scoop Packages..." -ForegroundColor "Yellow"

# Scoop Utilities
scoop install sudo
scoop install 7zip
scoop install innounp
scoop install dark
scoop install lessmsi
scoop install aria2
scoop install scoop-completion

# Programming Languages
scoop install go
scoop install nodejs-lts
scoop install perl
scoop install python
# Allow other applications to find python
# $pythonDir = Invoke-Expression "scoop prefix python"
# Invoke-Expression "$pythonDir\install-pep-514.reg"
# TODO: Upgrade pip and setuptools
scoop install python27
scoop install ruby26
# TODO: run gem update --system then gem update
scoop install rustup

# Development Tools
scoop install bat
# scoop install colortool
scoop install dust
scoop install fd
# scoop install grex
scoop install heroku-cli
scoop install less
scoop install lsd
scoop install make
scoop install msys2
# ridk exec pacman -S mingw-w64-x86_64-gdbm
# TODO: run msys2 then ridk install
scoop install neovim
# scoop install NuGet
scoop install ripgrep
scoop install s
# scoop install sqlite
scoop install winfetch

# Shells and Terminals
scoop install pwsh
scoop install windows-terminal

# Git Tools
scoop install github
scoop install gitkraken
scoop install hub
scoop install lazygit
scoop install onefetch

# Applications
scoop install android-studio
scoop install bulk-crap-uninstaller
scoop install ccleaner
scoop install imagemagick
scoop install inkscape
scoop install powertoys
# scoop install rufus
scoop install snappy-driver-installer-origin
scoop install speccy
scoop install sumatrapdf
scoop install teracopy-np
scoop install zeal

# Music Applications
scoop install dopamine
scoop install ffmpeg
scoop install mpv
scoop install musikcube
scoop install picard
scoop install spotify-tui
scoop install youtube-dl

# Fonts
scoop install FiraCode-NF
scoop install Hack-NF

# Windows Redistributable
scoop install vcredist2010
scoop install vcredist2015
scoop install vcredist2019
scoop uninstall vcredist2010
scoop uninstall vcredist2015
scoop uninstall vcredist2019

# Cleanup Scoop Cache
scoop cache rm *

# ------------------------------------------------------------------------------------------------------- #

# Bash Tools
# ==========

# TODO: Ensure bash is installed

# https://github.com/tj/git-extras

# https://github.com/git-friendly/git-friendly

# https://github.com/fboender/multi-git-status

# https://github.com/patevs/ls-with-git-status

# https://github.com/bill-auger/git-branch-status

# neofetch (scoop -> requires git)
# https://github.com/dylanaraps/neofetch/

# ------------------------------------------------------------------------------------------------------- #

# DotNet Tools
# ============

# TODO: Ensure dotnet is installed

# NOTE: Requires .NET Core 2.1 SDK or newer

# dotnet tool install --global dotnet-outdated
# dotnet tool install --global dotnet-retire
# dotnet tool install --global git-status-cli
# dotnet tool install --global Moniker.Cli
# dotnet tool install --global nyancat

# ------------------------------------------------------------------------------------------------------- #

# Go Tools
# ========

# TODO: Ensure go is installed

# gitbatch
# go get -u github.com/isacikgoz/gitbatch/cmd/gitbatch
# gotop
# go get -u github.com/xxxserxxx/gotop/cmd/gotop
# lsp
# go get github.com/dborzov/lsp

# ------------------------------------------------------------------------------------------------------- #

# Python Tools
# ============

# TODO: Ensure python and pip are installed

# buku
# pip3 install buku

# Install buku required dependencies
# python -m pip install certifi urllib3 cryptography beautifulsoup4
# Install buku
# python -m pip install buku
# Install bukuserver required dependencies
# python -m pip install flask flask_admin flask_api flask_bootstrap flask_paginate flask_wtf arrow

# wig
# https://github.com/jekyc/wig

# ------------------------------------------------------------------------------------------------------- #

# Rust Tools
# ==========

# TODO: Ensure rustup, rust, and cargo are installed

## bat-extras

# cargo install du-dust
# cargo install eva
# cargo install tokei

# Invoke-Expression "cargo install du-dust"
# Invoke-Expression "cargo install eva"
# Invoke-Expression "cargo install tokei"

# ------------------------------------------------------------------------------------------------------- #

# NodeJS and NPM
# ==============

# nvm on
# $nodeLtsVersion = choco search nodejs-lts --limit-output | ConvertFrom-String -TemplateContent "{Name:package-name}\|{Version:1.11.1}" | Select -ExpandProperty "Version"
# nvm install $nodeLtsVersion
# nvm use $nodeLtsVersion
# Remove-Variable nodeLtsVersion

# gem pristine --all --env-shebang

### Node Packages
<#
Write-Host "Installing Node Packages..." -ForegroundColor "Yellow"
if (which npm) {
  npm update npm
  # npm install -g gulp
  # npm install -g mocha
  # npm install -g node-inspector
  npm install -g yo
}
#>

# ------------------------------------------------------------------------------------------------------- #

# EOF #
