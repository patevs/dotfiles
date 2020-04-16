# ------------------- #
# components/yarn.ps1 #
# ------------------- #

# Write-Output "components/yarn.ps1"

if ((Get-Command yarn -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable yarn-completion -ErrorAction SilentlyContinue)) {
  Import-Module -Name yarn-completion
}

# EOF #
