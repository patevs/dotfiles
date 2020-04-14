# -------------- #
# components.ps1 #
# -------------- #

# These components will be loaded for all PowerShell instances

Write-Output "components.ps1"

Push-Location (Join-Path (Split-Path -parent $profile) "components")

# From within the ./components directory...
# . .\cargo.ps1
# . .\dotnet.ps1
# . .\git.ps1
# . .\npm.ps1
# . .\yarn.ps1

Pop-Location

# EOF #
