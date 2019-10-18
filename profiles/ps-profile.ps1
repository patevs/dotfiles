# -------------------------------- #
#                                  #
# ------ POWERSHELL PROFILE ------ #
#                                  #
#          @author patevs          #
# -------------------------------- #

# Increase history
$MaximumHistoryCount = 10000

# Produce UTF-8 by default
$PSDefaultParameterValues["Out-File:Encoding"]="utf8"

# Import Posh-Git module
# Import-Module -Name posh-git

# Start SSH agent
# Start-SshAgent

####################
# Helper Functions #
####################

function reload-profile {
	& $profile
}

function print-path {
	($Env:Path).Split(";")
}

######################
# Unix-like Commands #
######################

function grep($regex, $dir) {
	if ( $dir ) {
		ls $dir | select-string $regex
		return
	}
	$input | select-string $regex
}

function which($name) {
	Get-Command $name | Select-Object -ExpandProperty Definition
}

function touch($file) {
	"" | Out-File $file -Encoding ASCII
}

function sudo {
	$file, [string]$arguments = $args;
	$psi = new-object System.Diagnostics.ProcessStartInfo $file;
	$psi.Arguments = $arguments;
	$psi.Verb = "runas";
	$psi.WorkingDirectory = get-location;
	[System.Diagnostics.Process]::Start($psi) >> $null
}

###########
# Aliases #
###########

# function pull () { & get pull $args }
# function checkout () { & git checkout $args }

# del alias:gc -Force
# del alias:gp -Force

# Set-Alias -Name gc -Value checkout
# Set-Alias -Name gp -Value pull

##################
# System Related #
##################

# Shutdown system
function shutdownSys {
  Write-Host "`nShutting down system...`n"
  shutdown /p
}

# Restart system
function restartSys {
  Write-Host "`nRestarting system...`n"
  shutdown /r /t 0
}

Set-Alias -Name shut -Value shutdownSys
Set-Alias -Name restart -Value restartSys
Set-Alias -Name reboot -Value restartSys

# Move to Desktop directory (~\desktop)
function moveDesktop {
  $desktopPath = $env:USERPROFILE + "\desktop"
  Set-Location $desktopPath
}

# Move to development directory (~\desktop\git)
function moveDev {
  $devPath = $env:USERPROFILE + "\desktop\git"
  Set-Location $devPath
  # Clear-Host
  # getDirList
}

Set-Alias -Name desktop -Value moveDesktop
Set-Alias -Name desk -Value moveDesktop
Set-Alias -Name dev -Value moveDev

###############
# Git Related #
###############

# Use github client
# Set-Alias -Name git -Value getGithubClient
# function getGithubClient { hub $args }

# Print Git status
# Set-Alias -Name gs -Value getGitStatus
# TODO: Check for presence of g3l command
# function getGitStatus { git status }


# EOF #
