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
Get-PackageProvider NuGet -Force | Out-Null
# Chocolatey Provider is not ready yet. Use normal Chocolatey
#Get-PackageProvider Chocolatey -Force
#Set-PackageSource -Name chocolatey -Trusted

# ------------------------------------------------------------------------------------------------------- #

# PowerShell Modules
# ==================

Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module -Name PackageManagement
Install-Module -Name PowerShellGet
# Install-Module -Name PowerShellGet -Force -SkipPublisherCheck
# Install-Module -Name Configuration

Install-Module -Name PSReadLine -Scope CurrentUser -Force
Install-Module -Name PSWindowsUpdate -Scope CurrentUser -Force
# Install-Module -Name PSWriteColor -Scope CurrentUser -Force

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

<#
Write-Host "Installing Desktop Utilities..." -ForegroundColor "Yellow"
if ((which cinst) -eq $null) {
  iex (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
  Refresh-Environment
  choco feature enable -n=allowGlobalConfirmation
}
#>

# system and cli
# choco install curl                --limit-output
# choco install nuget.commandline   --limit-output
# choco install webpi               --limit-output
# choco install git.install         --limit-output -params '"/GitAndUnixToolsOnPath /NoShellIntegration"'
# choco install nvm.portable        --limit-output
# choco install python              --limit-output
# choco install ruby                --limit-output

#fonts
# choco install sourcecodepro       --limit-output

# browsers
# choco install GoogleChrome        --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome        --limit-output
# choco install GoogleChrome.Canary --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome.Canary --limit-output
# choco install Firefox             --limit-output; <# pin; evergreen #> choco pin add --name Firefox             --limit-output
# choco install Opera               --limit-output; <# pin; evergreen #> choco pin add --name Opera               --limit-output

# dev tools and frameworks
# choco install atom                --limit-output; <# pin; evergreen #> choco pin add --name Atom                --limit-output
# choco install Fiddler             --limit-output
# choco install vim                 --limit-output
# choco install winmerge            --limit-output

RefreshEnvironment

# ------------------------------------------------------------------------------------------------------- #

# Scoop
# =====

# TODO: ENsure git is installed

Write-Host "Installing Scoop..." -ForegroundColor "Yellow"

# TODO: Check current execution policy
# Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Verify if scoop is installed
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

# Fix for scoop error: https://github.com/lukesampson/scoop/issues/3528
Invoke-Expression "scoop config alias @{}"

# Install scoop packages
Write-Host "Installing Scoop Packages..." -ForegroundColor "Yellow"

scoop install sudo
scoop install 7zip
scoop install innounp
scoop install dark
scoop install lessmsi
scoop install aria2

scoop install bat
# scoop install colortool
scoop install dust
scoop install fd
scoop install go
# scoop install grex
scoop install heroku-cli
scoop install less
scoop install lsd
scoop install make
scoop install msys2
scoop install neovim
scoop install nodejs-lts
scoop install perl
scoop install pwsh
# TODO: Upgrade pip and setuptools
scoop install python
scoop install python27
scoop install ripgrep
scoop install ruby26

scoop install github
scoop install gitkraken
scoop install hub
scoop install lazygit
scoop install onefetch

scoop install bulk-crap-uninstaller
scoop install ccleaner
scoop install android-studio
scoop install powertoys
# scoop install rufus

scoop install imagemagick
scoop install inkscape

scoop install dopamine
scoop install ffmpeg
scoop install mpv
scoop install musikcube
scoop install picard

scoop install FiraCode-NF
scoop install Hack-NF

# scoop install rustup

# ------------------------------------------------------------------------------------------------------- #

# Bash Tools
# ==========

# TODO: Ensure bash is installed

# https://github.com/tj/git-extras

# https://github.com/git-friendly/git-friendly

# https://github.com/fboender/multi-git-status

# neofetch (scoop -> requires git)
# https://github.com/dylanaraps/neofetch/

# ------------------------------------------------------------------------------------------------------- #

# DotNet Tools
# ============

# TODO: Ensure dotnet is installed

# NOTE: Requires .NET Core 2.1 SDK or newer
# dotnet tool install --global dotnet-outdated
# dotnet tool install --global dotnet-retire
# NOTE: Requires .NET Core 2.1 SDK or newer
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

# s (scoop)

# ------------------------------------------------------------------------------------------------------- #

# PowerShell Tools
# ================

# Winfetch (scoop)
# https://github.com/lptstr/winfetch/

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

# Invoke-Expression "cargo install du-dust"
# Invoke-Expression "cargo install eva"
# Invoke-Expression "cargo install lsd"
# Invoke-Expression "cargo install monolith"
# Invoke-Expression "cargo install tokei"

# ------------------------------------------------------------------------------------------------------- #

# NodeJS
# ======

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
