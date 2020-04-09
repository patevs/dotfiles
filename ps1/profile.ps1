# ----------- #
# profile.ps1 #
# ----------- #

# Profile for PowerShell
# ======================

Push-Location (Split-Path -parent $profile)
"components","functions","aliases","exports" | Where-Object {Test-Path "$_.ps1"} | ForEach-Object -process {Invoke-Expression ". .\$_.ps1"}
Pop-Location

# EOF #
