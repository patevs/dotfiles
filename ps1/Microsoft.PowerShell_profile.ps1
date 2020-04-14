# -------------------------------- #
# Microsoft.PowerShell_profile.ps1 #
# -------------------------------- #
#
# Profile for Powershell
# ======================
#
# PowerShell Core Profile Location:
#   $env:HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
#
# ======================

Push-Location (Split-Path -parent $profile)
"components-shell" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location

# EOF #
