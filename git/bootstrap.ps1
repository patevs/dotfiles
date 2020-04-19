<#
.SYNOPSIS
  Global Git configuration install script.

.DESCRIPTION
  Copies Global Git configuration files to user home.

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  19/04/2020 - April 19th 2020

.EXAMPLE
  .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Profile directory location
$destinationDir = "~"

# --------------------------------- [Execution] --------------------------------- #

# Copy files to destination directory
Copy-Item -Path ./.git* -Destination $destinationDir

Remove-Variable destinationDir

# ------------------------------------ [END] ------------------------------------ #
