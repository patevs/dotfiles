
# ------------------------------------------- #
# config/ps1/Microsoft.PowerShell_profile.ps1 #
# ------------------------------------------- #

# $PROFILE
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# --------------------------------------------------------------------------- #

# Set-ExecutionPolicy unrestricted

# So we can launch pwsh in subshells if we need
Add-PathVariable "${env:ProgramFiles}\PowerShell\6-preview"

$profileDir = $PSScriptRoot;

# From https://serverfault.com/questions/95431/in-a-powershell-script-how-can-i-check-if-im-running-with-administrator-privil#97599
function Test-Administrator  {
	$user = [Security.Principal.WindowsIdentity]::GetCurrent();
	(New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

# Edit whole dir, so we can edit included files etc
function edit-powershell-profile {
	edit $profileDir
}

function update-powershell-profile {
	& $profile
}

# https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/powertip-change-the-powershell-console-title
# function set-title([string]$newtitle) {
# 	$host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
# }

# From http://stackoverflow.com/questions/7330187/how-to-find-the-windows-version-from-the-powershell-command-line
# function get-windows-build {
# 	[Environment]::OSVersion
# }

# function disable-windows-search {
# 	Set-Service wsearch -StartupType disabled
# 	stop-service wsearch
# }

function get-path {
	($Env:Path).Split(";")
}

# function get-serial-number {
#   Get-CimInstance -ClassName Win32_Bios | select-object serialnumber
# }

# --------------------------------------------------------------------------- #

# foreach ( $includeFile in ("defaults", "unix", "development", "node") ) {
# 	Unblock-File $profileDir\$includeFile.ps1
# . "$profileDir\$includeFile.ps1"
# }

# TODO: Ensure ~/Desktop/git directory exists
# set-location '~/Desktop/git'

# write-output "Pat's profile loaded!"


# EOF #

