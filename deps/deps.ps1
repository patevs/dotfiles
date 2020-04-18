# -------- #
# deps.ps1 #
# -------- #

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
}

Write-Host "Adding Scoop Buckets..." -ForegroundColor "Yellow"

Invoke-Expression "scoop bucket add extras"
Invoke-Expression "scoop bucket add versions"
Invoke-Expression "scoop bucket add nonportable"
Invoke-Expression "scoop bucket add nerd-fonts"
Invoke-Expression "scoop bucket add scoop-bucket https://github.com/Rigellute/scoop-bucket"
Invoke-Expression "scoop bucket add scoop-completion https://github.com/Moeologist/scoop-completion"

# Fix for scoop error: https://github.com/lukesampson/scoop/issues/3528
Invoke-Expression "scoop config alias @{}"

# Install scoop packages
Write-Host "Installing Scoop Packages..." -ForegroundColor "Yellow"

# scoop install rustup

<#
7zip (v:19.00) [main]
android-studio (v:3.6.3.0) [extras]
aria2 (v:1.35.0-1) [main]
bat (v:0.13.0) [main]
bulk-crap-uninstaller (v:4.16) [extras]
ccleaner (v:5.65.7632) [extras]
colortool (v:1904.29002) [main]
dark (v:3.11.2) [main]
dust (v:0.5.1) [main]
fd (v:8.0.0) [main]
ffmpeg (v:4.2.2) [main]
github (v:2.4.1) [extras]
gitkraken (v:6.5.4) [extras]
go (v:1.14.2) [main]
grex (v:1.1.0) [main]
hack-nf (v:2.1.0) [nerd-fonts]
heroku-cli (v:7.39.3) [main]
hub (v:2.14.2) [main]
imagemagick (v:7.0.10-6) [main]
inkscape (v:0.92.5) [extras]
innounp (v:0.49) [main]
lazygit (v:0.19) [extras]
less (v:551) [main]
lessmsi (v:1.6.91) [main]
make (v:4.3) [main]
mpv (v:0.32.0) [extras]
msys2 (v:20190524) [main]
neovim (v:0.4.3) [main]
nodejs-lts (v:12.16.2) [main]
onefetch (v:2.0.0) [extras]
perl (v:5.30.2.1) [main]
picard (v:2.3.1) [extras]
powertoys (v:0.16.1) [extras]
pwsh (v:7.0.0) [main]
python (v:3.8.2) [main]
python27 (v:2.7.17) [versions]
ripgrep (v:12.0.1) [main]
ruby26 (v:2.6.6-1) [versions]
scoop-completion (v:0.2.2) [scoop-completion]
snappy-driver-installer-origin (v:1.6.1.710) [extras]
speccy (v:1.32.740) [extras]
spotify-tui (v:0.17.1) [scoop-bucket]
sqlite (v:3.31.1) [main]
sudo (v:0.2020.01.26) [main]
sumatrapdf (v:3.2) [extras]
teracopy-np (v:3.26) [nonportable]
windows-terminal (v:0.10.781.0) [extras]
youtube-dl (v:2020.03.24) [main]
zeal (v:0.6.1) [extras]
#>

# ------------------------------------------------------------------------------------------------------- #

# Rust Tools
# ==========

# TODO: Ensure rustup, rust, and cargo are installed

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
