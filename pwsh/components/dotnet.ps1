# --------------------- #
# components/dotnet.ps1 #
# --------------------- #

# Write-Output "components/dotnet.ps1"

if ((Get-Command dotnet -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable posh-dotnet -ErrorAction SilentlyContinue)) {
  Import-Module -Name posh-dotnet
}

# EOF #
