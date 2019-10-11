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
Import-Module -Name posh-git

# Start SSH agent
Start-SshAgent

####################
# Helper Functions #
####################

function reload-profile {
	& $profile
}

function print-path {
	($Env:Path).Split(";")
}


# EOF #
