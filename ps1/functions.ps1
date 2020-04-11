# ------------- #
# functions.ps1 #
# ------------- #

# Basic commands
function which($name) { Get-Command $name -ErrorAction SilentlyContinue | Select-Object Definition }
function touch($file) { "" | Out-File $file -Encoding ASCII }

# Common Editing needs
# function Edit-Hosts { Invoke-Expression "sudo $(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $env:windir\system32\drivers\etc\hosts" }
# function Edit-Profile { Invoke-Expression "$(if($env:EDITOR -ne $null)  {$env:EDITOR } else { 'notepad' }) $profile" }

# So we can launch pwsh in subshells if we need
# Add-PathVariable "${env:ProgramFiles}\PowerShell\6-preview"

# $profileDir = $PSScriptRoot;
# Edit whole dir, so we can edit included files etc.
function edit-profile {
	edit $profileDir
}

# Sudo
<#
function sudo() {
  if ($args.Length -eq 1) {
    start-process $args[0] -verb "runAs"
  }
  if ($args.Length -gt 1) {
    start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
  }
}
#>

# System Update - Update RubyGems, NPM, and their installed packages
function SystemUpdate() {
  Install-WindowsUpdate -IgnoreUserInput -IgnoreReboot -AcceptAll
  Update-Module
  Update-Help -Force
  gem update --system
  gem update
  npm install npm -g
  npm update -g
}

# Reload the Shell
# & $profile
function ReloadPowershell {
  $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
  $newProcess.Arguments = "-nologo";
  [System.Diagnostics.Process]::Start($newProcess);
  exit
}

# Get Current PowerShell Version
function version {
  $PSVersionTable.PSVersion
}

# Get Installed PowerShell Modules
function modules {
  Get-InstalledModule
}

# Reset the console colors
#   https://stackoverflow.com/a/42624497
# function reset-colors {
#   [Console]::ResetColor()
# }

# function disable-windows-search {
# 	Set-Service wsearch -StartupType disabled
# 	stop-service wsearch
# }

# https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/powertip-change-the-powershell-console-title
# function set-title([string]$newtitle) {
# 	$host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
# }

# From http://stackoverflow.com/questions/7330187/how-to-find-the-windows-version-from-the-powershell-command-line
# function get-windows-build {
# 	[Environment]::OSVersion
# }

# function get-serial-number {
#   Get-CimInstance -ClassName Win32_Bios | select-object serialnumber
# }

### System & Utility functions
### ----------------------------

# Shutdown System
function shutdown {
  # Write-Host "`nShutting down system...`n"
  # Print-Green-Underline "Shutting Down System..."
  Write-Output "`nShutting Down System...`n"
  shutdown /p
}
Set-Alias -Name shut -Value shutdown

# Restart System
function restart {
  # Write-Host "`nRestarting system...`n"
  # Print-Green-Underline "Restarting System..."
  Write-Output "`nRestarting System...`n"
  shutdown /r /t 0
}
Set-Alias -Name reboot -Value restart


# Empty the Recycle Bin on all drives
function EmptyRecycleBin {
  $RecBin = (New-Object -ComObject Shell.Application).Namespace(0xA)
  # $RecBin.Items() | %{Remove-Item $_.Path -Recurse -Confirm:$false}
  $RecBin.Items() | ForEach-Object{Remove-Item $_.Path -Recurse -Confirm:$false}
}


### File System functions
### ----------------------------
# Create a new directory and enter it
function CreateAndSetDirectory([String] $path) {
  New-Item $path -ItemType Directory -ErrorAction SilentlyContinue
  Set-Location $path
}

# Determine size of a file or total size of a directory
function GetDiskUsage([string] $path=(Get-Location).Path) {
    Convert-ToDiskSize `
        ( `
            Get-ChildItem .\ -recurse -ErrorAction SilentlyContinue `
            | Measure-Object -property length -sum -ErrorAction SilentlyContinue
        ).Sum `
        1
}

# Cleanup all disks (Based on Registry Settings in `windows.ps1`)
<#
function CleanDisks {
    Start-Process "$(Join-Path $env:WinDir 'system32\cleanmgr.exe')" -ArgumentList "/sagerun:6174" -Verb "runAs"
}
#>

### Environment functions
### ----------------------------

# Reload the $env object from the registry
function RefreshEnvironment {
    $locations =
      'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
      'HKCU:\Environment'

    $locations | ForEach-Object {
        $k = Get-Item $_
        $k.GetValueNames() | ForEach-Object {
            $name  = $_
            $value = $k.GetValue($_)
            Set-Item -Path Env:\$name -Value $value
        }
    }

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# Set a permanent Environment variable, and reload it into $env
function SetEnvironment([String] $variable, [String] $value) {
    Set-ItemProperty "HKCU:\Environment" $variable $value
    # Manually setting Registry entry. SetEnvironmentVariable is too slow because of blocking HWND_BROADCAST
    #[System.Environment]::SetEnvironmentVariable("$variable", "$value","User")
    Invoke-Expression "`$env:${variable} = `"$value`""
}

# Get Environment Path
function GetPath {
	($Env:Path).Split(";")
}

# Add a folder to $env:Path
# function PrependEnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
# function PrependEnvPathIfExists([String]$path) { if (Test-Path $path) { PrependEnvPath $path } }
# function AppendEnvPath([String]$path) { $env:PATH = $env:PATH + ";$path" }
# function AppendEnvPathIfExists([String]$path) { if (Test-Path $path) { AppendEnvPath $path } }


### Git & Github
### ----------------------------

# TODO: Move the following functions to aliases.ps1

# Git Multi Status
function getGitMultiStatus {
  # Invoke-Expression
  bash C:\tools\multi-git-status\mgitstatus
}
Set-Alias -Name mgs -Value getGitMultiStatus

# Use GitHub's hub Client in favor of git
if (Get-Command hub -ErrorAction SilentlyContinue) { Set-Alias git hub }

# ! TODO: Refactor the following functions to be more concise

# Print Git Status
function getGitStatus {
  # Check git command exists
  if (Get-Command git -ErrorAction SilentlyContinue){
    Write-Host "`n Git Status:`n"  -ForegroundColor Green
    # Print-Green-Underline "Git Status:"
    git status
  } else {
    Write-Host "`n Git installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name gs -Value getGitStatus


# Print git status using g3l
function getG3lStatus {
  # Check git command exists
  if (Get-Command git -ErrorAction SilentlyContinue){
    # Fetch git remote
    Write-Host "`n Git Remotes:`n"  -ForegroundColor Green
    # Print-Green-Underline "Git Remotes:"
    git remote -v
    Write-Host "`n Git Status:`n"  -ForegroundColor Green
    # Print-Green-Underline "Git Status:"
    # Check g3l command exists
    if (Get-Command g3l -ErrorAction SilentlyContinue) {
      g3l --status
      Write-Host "" # new line
    }
    git status
  } else {
    Write-Host "`n Git installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name gss -Value getG3lStatus


### NodeJS & NPM
### ----------------------------

# Print list of local NPM dependencies
function getNpmLocals {
  # Check node_modules directory exists
  if (Test-Path node_modules){
    # Check npm command exists
    if (Get-Command npm -ErrorAction SilentlyContinue){
      Write-Host "`n Local NPM Dependencies:`n" -ForegroundColor Green
      # Print-Green-Underline "Local NPM Dependencies:"
      npm list --depth=0
    } else {
      Write-Host "`n NPM installation could not be found!" -ForegroundColor Red
    }
  } else {
    Write-Host "`n node_modules folder does not exist in current directory!" -ForegroundColor Red
  }
}
Set-Alias -Name npl -Value getNpmLocals

# Print list of global NPM dependencies
function getNpmGlobals {
  # Check npm command exists
  if (Get-Command npm -ErrorAction SilentlyContinue){
    Write-Host "`n Global NPM Dependencies:`n" -ForegroundColor Green
    # Print-Green-Underline "Global NPM Dependencies:"
    npm list --global --depth=0
  } else {
    Write-Host "`n NPM installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name nplg -Value getNpmGlobals


### Chocolatey
### ----------------------------

# Print list of local chocolatey installations
function getChocoInstalls {
  # Check choco command exists
  if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "`n Local Chocolatey Installations:`n" -ForegroundColor Green
    # Print-Green-Underline "Local Chocolatey Installations:"
    choco list -l
  } else {
    Write-Host "`n Chocolatey installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name cll -Value getChocoInstalls

# Print list of outdated chocolatey installations
function getChocoOutdated {
  # Check choco command exists
  if (Get-Command choco -ErrorAction SilentlyContinue) {
    Write-Host "`n Outdated Chocolatey Installations:`n" -ForegroundColor Green
    # Print-Green-Underline "Outdated Chocolatey Installations:"
    choco upgrade all --noop
  } else {
    Write-Host "`n Chocolatey installation could not be found!" -ForegroundColor Red
  }
}
Set-Alias -Name clo -Value getChocoOutdated

# Chocolatey Profile
# TODO: Move this to components/choco.ps1
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile" -Force
}

# Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1” -Force


### Scoop
### ----------------------------

# TODO: Move this to components/scoop.ps1
try {
  Import-Module -ErrorAction Stop "$($(Get-Item $(Get-Command -ErrorAction Stop scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
} catch { }


### Utilities
### ----------------------------

# Convert a number to a disk size (12.4K or 5M)
<#
function Convert-ToDiskSize {
    param ( $bytes, $precision='0' )
    foreach ($size in ("B","K","M","G","T")) {
        if (($bytes -lt 1000) -or ($size -eq "T")){
            $bytes = ($bytes).tostring("F0" + "$precision")
            return "${bytes}${size}"
        }
        else { $bytes /= 1KB }
    }
}
#>

# Extract a .zip file
<#
function Unzip-File {
    <#
    .SYNOPSIS
      Extracts the contents of a zip file.

    .DESCRIPTION
      Extracts the contents of a zip file specified via the -File parameter to the
      location specified via the -Destination parameter.

    .PARAMETER File
        The zip file to extract. This can be an absolute or relative path.

    .PARAMETER Destination
        The destination folder to extract the contents of the zip file to.

    .PARAMETER ForceCOM
        Switch parameter to force the use of COM for the extraction even if the .NET Framework 4.5 is present.

    .EXAMPLE
      Unzip-File -File archive.zip -Destination .\d

    .EXAMPLE
      'archive.zip' | Unzip-File

    .EXAMPLE
      Get-ChildItem -Path C:\zipfiles | ForEach-Object {$_.fullname | Unzip-File -Destination C:\databases}

    .INPUTS
      String

    .NOTES
      Inspired by:  Mike F Robbins, @mikefrobbins

      This function first checks to see if the .NET Framework 4.5 is installed and uses it for the unzipping process, otherwise COM is used.

    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$File,

        [ValidateNotNullOrEmpty()]
        [string]$Destination = (Get-Location).Path
    )

    $filePath = Resolve-Path $File
    $destinationPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destination)

    if (($PSVersionTable.PSVersion.Major -ge 3) -and
      ((Get-ItemProperty -Path "HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full" -ErrorAction SilentlyContinue).Version -like "4.5*" -or
      (Get-ItemProperty -Path "HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Client" -ErrorAction SilentlyContinue).Version -like "4.5*")) {

        try {
            [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null
            [System.IO.Compression.ZipFile]::ExtractToDirectory("$filePath", "$destinationPath")
        } catch {
            Write-Warning -Message "Unexpected Error. Error details: $_.Exception.Message"
        }
    } else {
        try {
            $shell = New-Object -ComObject Shell.Application
            $shell.Namespace($destinationPath).copyhere(($shell.NameSpace($filePath)).items())
        } catch {
            Write-Warning -Message "Unexpected Error. Error details: $_.Exception.Message"
        }
    }
}
#>

# EOF #
