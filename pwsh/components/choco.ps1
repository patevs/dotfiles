# -------------------- #
# components/choco.ps1 #
# -------------------- #

Write-Output "components/choco.ps1"

<#
if ((Get-Command choco -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable posh-cargo -ErrorAction SilentlyContinue)) {
  Import-Module -Name posh-cargo
}
#>

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile" -Force
}

# Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1” -Force

# EOF #
