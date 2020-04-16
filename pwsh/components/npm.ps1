# ------------------ #
# components/npm.ps1 #
# ------------------ #

# Write-Output "components/npm.ps1"

if ((Get-Command npm -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable npm-completion -ErrorAction SilentlyContinue)) {
  # Import-Module -Name posh-npm
  Import-Module -Name npm-completion
}

# EOF #
