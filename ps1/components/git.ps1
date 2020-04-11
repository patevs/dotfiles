# ------------------ #
# components/git.ps1 #
# ------------------ #

# if (((Get-Command git -ErrorAction SilentlyContinue) -ne $null) -and ((Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue) -ne $null)) {
#   Import-Module Posh-Git
# }

if ((Get-Command git -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable Posh-Git -ErrorAction SilentlyContinue)) {
  Import-Module -Name posh-git
}

# EOF #
