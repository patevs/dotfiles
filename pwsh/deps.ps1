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


### Update Help for Modules
# Write-Host "Updating Help..." -ForegroundColor "Yellow"
# Update-Help -Force


### Package Providers
Write-Host "Installing Package Providers..." -ForegroundColor "Yellow"
Get-PackageProvider NuGet -Force | Out-Null
# Chocolatey Provider is not ready yet. Use normal Chocolatey
#Get-PackageProvider Chocolatey -Force
#Set-PackageSource -Name chocolatey -Trusted


### Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module -Name PackageManagement
Install-Module -Name PowerShellGet
# Install-Module -Name Configuration

Install-Module npm-completion -Scope CurrentUser -Force
Install-Module posh-cargo -Scope CurrentUser -Force -AllowClobber
# posh-cli
Install-Module posh-dotnet -Scope CurrentUser -Force
Install-Module posh-git -Scope CurrentUser -Force -AllowClobber
# Install-Module posh-npm -Scope CurrentUser -Force
Install-Module -Name PSReadLine -Scope CurrentUser -Force
Install-Module -Name PSWindowsUpdate -Scope CurrentUser -Force
# Install-Module -Name PSWriteColor -Scope CurrentUser -Force
Install-Module -Name scoop-completion -Scope CurrentUser -Force -AllowClobber
# Install-Module Terminal-Icons -Scope CurrentUser -Force
# Install-Module Get-ChildItemColor -Scope CurrentUser -Force
Install-Module -Name yarn-completion -Scope CurrentUser -Force


### Chocolatey
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

# EOF #
