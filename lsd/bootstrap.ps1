<#
.SYNOPSIS
    Global `lsd` configuration bootstrap script.

.DESCRIPTION
    Copies global `lsd` configuration file to configuration directory.

.NOTES
    Version:        1.0
    Author:         PatEvs (github.com/patevs)
    Last Modified:  19/01/2022 - Janurary 19th 2022

.EXAMPLE
    .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# Configuration directory location
$destinationDir = "$env:APPDATA\lsd"

# --------------------------------- [Execution] --------------------------------- #

# Create destination directory
New-Item $destinationDir -ItemType Directory -Force -ErrorAction SilentlyContinue # 2>&1 | Out-Null

# Copy file to destination directory
Copy-Item -Path ./config.yaml -Destination $destinationDir

Remove-Variable destinationDir

# ------------------------------------ [END] ------------------------------------ #
