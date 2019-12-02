# ------------------------------------------- #
# config/ps1/Microsoft.PowerShell_profile.ps1 #
# ------------------------------------------- #

# PowerShell $PROFILE
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

# --------------------------------------------------------------------------- #

# Set-ExecutionPolicy unrestricted

# So we can launch pwsh in subshells if we need
# Add-PathVariable "${env:ProgramFiles}\PowerShell\6-preview"

$profileDir = $PSScriptRoot;

# Edit whole dir, so we can edit included files etc.
function edit-profile {
	edit $profileDir
}

function reload-profile {
	& $profile
}

function get-path {
	($Env:Path).Split(";")
}

# Print PowerShell version
function ps-version {
  $PSVersionTable.PSVersion
}

# Print list of installed PowerShell modules
function ps-modules {
  Get-InstalledModule
}

# function disable-windows-search {
# 	Set-Service wsearch -StartupType disabled
# 	stop-service wsearch
# }

# https://blogs.technet.microsoft.com/heyscriptingguy/2012/12/30/powertip-change-the-powershell-console-title
# function set-title([string]$newtitle) {
# 	$host.ui.RawUI.WindowTitle = $newtitle + ' – ' + $host.ui.RawUI.WindowTitle
# }

# From http://stackoverflow.com/questions/7330187/how-to-find-the-windows-version-from-the-powershell-command-line
# function get-windows-build {
# 	[Environment]::OSVersion
# }

# function get-serial-number {
#   Get-CimInstance -ClassName Win32_Bios | select-object serialnumber
# }

# --------------------------------------------------------------------------- #

foreach ( $includeFile in ("defaults", "unix", "development") ) {
	Unblock-File $profileDir\$includeFile.ps1
  . "$profileDir\$includeFile.ps1"
}

# TODO: Ensure ~/Desktop/git directory exists
# set-location '~/Desktop/git'

# write-output "Pat's profile loaded!"

# ------------------------ #
# Logging Helper Functions #
# ------------------------ #

# Print a given string colored green
function Print-Green ($str) {
  Write-Host $str -ForegroundColor green
}

# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-host?view=powershell-6
# https://www.reddit.com/r/PowerShell/comments/d74lce/how_to_underline_text_in_output_using_writehost/
function printTest {
  # Write-Host "Red on white text." -ForegroundColor red -BackgroundColor white
  Write-Host "Hello $([char]27)[4mWorld$([char]27)[24m"
  # Explanation:
  #  <Escape Character>[4m = "Underline on"
  #  <Escape Character>[24m = "Underline off"
}
# printTest

# Print a welcome message
function printWelcome {
  # Write-Host
  Print-Green
  "             _    _ _____ _     _____ ________  ___ _____
            | |  | |  ___| |   /  __ \  _  |  \/  ||  ___|
            | |  | | |__ | |   | /  \/ | | | .  . || |__
            | |/\| |  __|| |   | |   | | | | |\/| ||  __|
            \  /\  / |___| |___| \__/\ \_/ / |  | || |___
             \/  \/\____/\_____/\____/\___/\_|  |_/\____/

                      ________ _______ ________
                      ___  __ \___    |___  __/
                      __  /_/ /__  /| |__  /
                      _  ____/ _  ___ |_  /
                      /_/      /_/  |_|/_/
  "
}
printWelcome


# EOF #

