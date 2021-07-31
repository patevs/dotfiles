<#
.SYNOPSIS
  Global RubyGems configuration bootstrap script.

.DESCRIPTION
  Copies Global RubyGems configuration file to user home directory.

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  31/07/2021 - July 31st 2021

.EXAMPLE
  .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# User home directory location
$destinationDir = "~"

# --------------------------------- [Execution] --------------------------------- #

# Copy file to destination directory
Copy-Item -Path ./.gemrc -Destination $destinationDir

Remove-Variable destinationDir

# ------------------------------------ [END] ------------------------------------ #
