# -------- #
# deps.ps1 #
# -------- #

Write-Host "" # New Line

# ------------------------------------------------------------------------------------------------------- #

# Check OS and ensure we are running on Windows
if (-Not ($Env:OS -eq "Windows_NT")) {
  Write-Host "Error: This script only supports Windows machines. Exiting..."
  exit 1
}

# Test if running as administrator
# http://serverfault.com/questions/95431
function Test-Elevated {
  # Get the ID and security principal of the current user account
  $userID = [System.Security.Principal.WindowsIdentity]::GetCurrent()
  $userPrincipal = New-Object System.Security.Principal.WindowsPrincipal($userID)
  # Check to see if we are currently running "as Administrator"
  return $userPrincipal.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)
}

# Check to see if we are currently running "as Administrator"
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

# Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"

# TODO: Run this with powershell not pwsh to install globally
# TODO: Uninstall/remove version 1.0.0.1
Install-Module -Name PackageManagement # -Force
# TODO: Run this with powershell not pwsh to install globally
# TODO: Uninstall/remove version 1.0.0.1
Install-Module -Name PowerShellGet -Force
# Install-Module -Name PowerShellGet -SkipPublisherCheck # -Force
# PS 6+
# Install-Module -Name Pester -Scope CurrentUser
# PS 5.1
# Install-Module -Name Pester -Force -SkipPublisherCheck -Scope CurrentUser
# Install-Module -Name Configuration

Install-Module -Name PSReadLine -Scope CurrentUser # -Force
Install-Module -Name PSWindowsUpdate -Scope CurrentUser # -Force
Install-Module -Name PSWriteColor -Scope CurrentUser # -Force
# Install-Module -Name PSKoans -Scope CurrentUser -Force
# Install-Module -Name PSeudo -Scope CurrentUser -Force

Install-Module -Name npm-completion -Scope CurrentUser # -Force
Install-Module -Name posh-cargo -Scope CurrentUser -AllowClobber # -Force
# Install-Module -Name posh-cli -Scope CurrentUser -Force
Install-Module -Name posh-dotnet -Scope CurrentUser # -Force
Install-Module -Name posh-git -Scope CurrentUser  -AllowClobber # -Force
# Install-Module -Name posh-npm -Scope CurrentUser -Force
Install-Module -Name scoop-completion -Scope CurrentUser -AllowClobber # -Force
Install-Module -Name yarn-completion -Scope CurrentUser # -Force

# Install-Module Terminal-Icons -Scope CurrentUser -Force
# Install-Module Get-ChildItemColor -Scope CurrentUser -Force

# ------------------------------------------------------------------------------------------------------- #

# Chocolatey Installs
# ===================

Write-Host "Installing Chocolatey..." -ForegroundColor "Yellow"

# Verify chocolatey is installed
if (which cinst) {
  # Update chocolatey
  choco upgrade chocolatey -y
} else {
  # Install chocolatey
  Invoke-Expression (new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')
  RefreshEnvironment
}

choco feature enable -n=allowGlobalConfirmation

# System and Development Tools
choco install 7zip.install
# choco install curl                --limit-output
# choco install dexpot
# choco install driverbooster
# choco install Fiddler             --limit-output
choco install git.install
choco install jdk8
# choco install nuget.commandline   --limit-output
# choco install nvm.portable        --limit-output
# choco install poweriso
# choco install pulseaudio
# choco install pyenv-win
# choco install reactotron
# choco install rpi-imager
# choco install rsvg-convert
# choco install sdformatter
# choco install vcxsrv
# choco install visualstudio2019community
choco install visualstudio2019buildtools
choco install vscode.install
# choco install webpi               --limit-output
# choco install winmerge            --limit-output

# Fonts
# choco install sourcecodepro       --limit-output

# Web Browsers
choco install Firefox               # --limit-output; <# pin; evergreen #> choco pin add --name Firefox             --limit-output
choco install GoogleChrome          # --limit-output; <# pin; evergreen #> choco pin add --name GoogleChrome        --limit-output

# Applications
# choco install Explorerplusplus
choco install figma
choco install gimp
choco install qbittorrent
choco install revo-uninstaller
choco install shortcut.install
choco install spotify
# choco install steam
choco install vlc

RefreshEnvironment

# ------------------------------------------------------------------------------------------------------- #

# Scoop Installs
# ==============

# TODO: Ensure git is installed

Write-Host "Installing Scoop..." -ForegroundColor "Yellow"

Set-ExecutionPolicy RemoteSigned -scope CurrentUser

# Verify scoop is installed
if (Get-Command scoop) {
  # Update scoop
  Invoke-Expression "scoop update"
} else {
  # Install scoop
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# Add scoop buckets
Write-Host "Adding Scoop Buckets..." -ForegroundColor "Yellow"
Invoke-Expression "scoop bucket add extras"
Invoke-Expression "scoop bucket add versions"
Invoke-Expression "scoop bucket add nonportable"
Invoke-Expression "scoop bucket add nerd-fonts"
# Invoke-Expression "scoop bucket add scoop-bucket https://github.com/Rigellute/scoop-bucket"
Invoke-Expression "scoop bucket add scoop-completion https://github.com/Moeologist/scoop-completion"

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
# scoop install dotnet-sdk
scoop install go
scoop install nodejs-lts
scoop install perl
scoop install python
# Allow other applications to find python
# $pythonDir = Invoke-Expression "scoop prefix python"
# Invoke-Expression "$pythonDir\install-pep-514.reg"
scoop install python27
scoop install ruby
# scoop install ruby26
scoop install rustup

# Development Tools
scoop install bat
# scoop install cmake
# scoop install colortool
scoop install dust
scoop install fd
# scoop install fzf
# scoop install gow
# scoop install grex
# scoop install heroku-cli
# scoop install hugo
# scoop install hugo-extended
scoop install jq
scoop install less
scoop install lsd
# scoop install make
scoop install msys2
scoop install neovim
# scoop install ninja
# scoop install NuGet
scoop install ripgrep
scoop install s
# scoop install scrcpy
# scoop install sqlite
scoop install winfetch
scoop install yarn

# Shells and Terminals
# scoop install cmder
# scoop install conemu
scoop install pwsh
# scoop install starship
scoop install windows-terminal

# Git Tools
# scoop install github
# scoop install gitkraken
scoop install hub
# scoop install lazygit
scoop install onefetch

# Applications
scoop install android-studio
# scoop install android-sdk
# scoop install atom
scoop install bulk-crap-uninstaller
scoop install ccleaner
# scoop install copyq
# scoop install etcher
# scoop install imagemagick
scoop install inkscape
# scoop install logitech-gaming-software-np
scoop install powertoys
# scoop install rufus
scoop install snappy-driver-installer-origin
scoop install speccy
scoop install sublime-text
scoop install sumatrapdf
scoop install teracopy-np
scoop install vncviewer
# scoop install vscodium
# scoop install win32-disk-imager
# scoop install zeal

# Databases
# scoop install postgresql

# Music Applications
scoop install dopamine
scoop install ffmpeg
# scoop install mpv
scoop install musikcube
# scoop install picard
# scoop install spotify-tui
scoop install youtube-dl

# Fonts
# scoop install FiraCode-NF
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

# Bash Installs
# =============

# TODO: Ensure bash is installed

# https://github.com/tj/git-extras

# https://github.com/git-friendly/git-friendly

# Note: Requires fzf and bc (scoop install fzf gow)
# https://github.com/bigH/git-fuzzy

# https://github.com/fboender/multi-git-status

# https://github.com/patevs/ls-with-git-status

# https://github.com/bill-auger/git-branch-status

# neofetch (scoop -> requires git)
# https://github.com/dylanaraps/neofetch/

# ------------------------------------------------------------------------------------------------------- #

# DotNet Installs
# ===============

# NOTE: Requires .NET Core 2.1 SDK or newer

Write-Host "Installing DotNet Tools..." -ForegroundColor "Yellow"

# Verify dotnet-sdk is installed
if (Get-Command dotnet) {
  Invoke-Expression "dotnet tool install --global dotnet-outdated"
  Invoke-Expression "dotnet tool install --global dotnet-retire"
  Invoke-Expression "dotnet tool install --global git-status-cli"
  Invoke-Expression "dotnet tool install --global Moniker.Cli"
  Invoke-Expression "dotnet tool install --global nyancat"
} else {
  Write-Host "ERROR DotNet-SDK is not install!" -ForegroundColor "Red"
}

# ------------------------------------------------------------------------------------------------------- #

# Go Installs
# ===========

Write-Host "Installing Go Tools..." -ForegroundColor "Yellow"

# Verify Go is installed
if (Get-Command go) {
  # Invoke-Expression "go get -u github.com/isacikgoz/gitbatch/cmd/gitbatch"
  Invoke-Expression "go get -u github.com/xxxserxxx/gotop/cmd/gotop"
  Invoke-Expression "go get github.com/dborzov/lsp"
} else {
  Write-Host "ERROR Go is not install!" -ForegroundColor "Red"
}

# ------------------------------------------------------------------------------------------------------- #

# Python2 Installs
# ================

# TODO: Ensure python2 and pip2 are installed

python2 -m pip install --upgrade pip
python2 -m pip install --upgrade setuptools

python2 -m pip install --upgrade virtualenv
python2 -m pip install --upgrade neovim

# ------------------------------------------------------------------------------------------------------- #

# Python3 Installs
# ================

# TODO: Ensure python3 and pip3 are installed

# python3 -m pip install --user --upgrade pip
python3 -m pip install --upgrade pip
# python3 -m pip install --user --upgrade setuptools
python3 -m pip install --upgrade setuptools

# python3 -m pip install --upgrade pipx
# python3 -m pipx ensurepath

python -m pip install --upgrade neovim
python3 -m pip install --upgrade thefuck

# python3 -m pip install --upgrade wakatime

# Poetry
# TODO: Ensure curl is installed
# Invoke-Expression "curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3"

# buku
# pip3 install buku

# Install buku required dependencies
# python -m pip install certifi urllib3 cryptography beautifulsoup4
# Install buku
# python -m pip install buku
# Install bukuserver required dependencies
# python -m pip install flask flask_admin flask_api flask_bootstrap flask_paginate flask_wtf arrow

# Print Buku version
# buku --version
# Print BukuServer version
# bukuserver --version

# DuckDuckGo utility
# python -m pip install ddgr

# wig
# https://github.com/jekyc/wig

# ------------------------------------------------------------------------------------------------------- #

# Ruby Installs
# =============

# TODO: Ensure Ruby, gem, and ridk are installed

ridk install 1,2,3
# ridk exec pacman -S mingw-w64-x86_64-gdbm

gem update --system
gem update

gem install bundler
gem install rails
gem install neovim

# ------------------------------------------------------------------------------------------------------- #

# Rust Installs
# =============

# TODO: Ensure rustup, rust, and cargo are installed

## bat-extras

# cargo install eva
# NOTE: Requires llvm to be installed (choco install llvm)
# cargo install git-delta
# cargo install tokei

# ------------------------------------------------------------------------------------------------------- #

# NodeJS and NPM Installs
# =======================

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
