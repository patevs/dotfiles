<#
.SYNOPSIS
    Global `bat` configuration bootstrap script.

.DESCRIPTION
    Copies global `bat` configuration file to configuration directory.

.NOTES
    Version:        1.0
    Author:         PatEvs (github.com/patevs)
    Last Modified:  04/10/2024 - October 4th 2024

.EXAMPLE
    .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Configuration directory location
$destinationDir = "$ENV:APPDATA\bat"

# --------------------------------- [Execution] --------------------------------- #

# Create destination directory
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy file to destination directory
Copy-Item -Path ./config -Destination $destinationDir

Remove-Variable destinationDir

# ------------------------------------ [END] ------------------------------------ #
