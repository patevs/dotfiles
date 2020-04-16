# ------------------ #
# components/git.ps1 #
# ------------------ #

# Write-Output "components/git.ps1"

if ((Get-Command git -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue)) {
  Import-Module -Name posh-git
}

# EOF #
