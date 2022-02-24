<#
.SYNOPSIS
  Global `yarn` configuration bootstrap script.

.DESCRIPTION
  Sets `yarn` global configuration options.

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  24/02/2022 - Feburary 24th 2022

  See: https://github.com/yarnpkg/yarn/issues/4457#issuecomment-414712423

.EXAMPLE
  .\bootstrap.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

# --------------------------------- [Execution] --------------------------------- #

# Ensure yarn is installed.
if (Get-Command yarn -ErrorAction SilentlyContinue) {
    # Enable emoji in output
    Invoke-Expression "echo '`"--emoji`" true' >> ~/.yarnrc"
}

# ------------------------------------ [END] ------------------------------------ #
