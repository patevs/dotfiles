# -------------------- #
# components/scoop.ps1 #
# -------------------- #

# Write-Output "components/scoop.ps1"

try {
  Import-Module -ErrorAction Stop "$($(Get-Item $(Get-Command -ErrorAction Stop scoop).Path).Directory.Parent.FullName)\modules\scoop-completion"
} catch {
  Write-Output "Error Importing Scoop Completion Module"
}

# EOF #
