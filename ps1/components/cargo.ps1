# -------------------- #
# components/cargo.ps1 #
# -------------------- #

if ((Get-Command cargo -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable posh-cargo -ErrorAction SilentlyContinue)) {
  Import-Module -Name posh-cargo
}

# EOF #
