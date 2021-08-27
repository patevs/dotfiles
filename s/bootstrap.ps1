<#
.SYNOPSIS
  Global `s` configuration bootstrap script.

.DESCRIPTION
  Copies global `s` configuration file to configuration directory.

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  27/08/2021 - August 27th 2021

.EXAMPLE
  .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Configuration directory location
$destinationDir = "~/.config/s"

# --------------------------------- [Execution] --------------------------------- #

# Create destination directory
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy file to destination directory
Copy-Item -Path ./config -Destination $destinationDir

Remove-Variable destinationDir

# ------------------------------------ [END] ------------------------------------ #
