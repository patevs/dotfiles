# -------------------- #
# components/choco.ps1 #
# -------------------- #

# Write-Output "components/choco.ps1"

# Chocolatey Profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile" -Force
}

# Import-Module “$env:ChocolateyInstall\helpers\chocolateyProfile.psm1” -Force

# EOF #
