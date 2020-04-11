# ------------------ #
# components/yarn.ps1 #
# ------------------ #

if ((Get-Command yarn -ErrorAction SilentlyContinue) -and (Get-Module -ListAvailable yarn-completion -ErrorAction SilentlyContinue)) {
  Import-Module yarn-completion
}

# EOF #
