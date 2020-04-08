<#
.SYNOPSIS
  Windows Terminal profile install script.

.DESCRIPTION
  Copies Windows Terminal profile.json to:

    "%USERPROFILE%\AppData\Local\Microsoft\Windows Terminal\profiles.json"

.NOTES
  Version:        1.0
  Author:         PatEvs (github.com/patevs)
  Last Modified:  08/04/2020 - April 8th 2020

.EXAMPLE
  .\install.ps1
#>

# -------------------------------- [Declarations] ------------------------------- #

#Script Version
# $sScriptVersion = "1.0"

#Log File Info
# $sLogPath = "C:\Windows\Temp"
# $sLogName = "<script_name>.log"
# $sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName

# $profileDir = Split-Path -parent $profile
# $componentDir = Join-Path $profileDir "components"

# --------------------------------- [Functions] --------------------------------- #

<#

Function <FunctionName>{
  Param()

  Begin{
    Log-Write -LogPath $sLogFile -LineValue "<description of what is going on>..."
  }

  Process{
    Try{
      <code goes here>
    }

    Catch{
      Log-Error -LogPath $sLogFile -ErrorDesc $_.Exception -ExitGracefully $True
      Break
    }
  }

  End{
    If($?){
      Log-Write -LogPath $sLogFile -LineValue "Completed Successfully."
      Log-Write -LogPath $sLogFile -LineValue " "
    }
  }
}

#>

# --------------------------------- [Execution] --------------------------------- #

#Log-Start -LogPath $sLogPath -LogName $sLogName -ScriptVersion $sScriptVersion
#Script Execution goes here
#Log-Finish -LogPath $sLogFile

# New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
# New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

# Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "bootstrap.ps1"
# Copy-Item -Path ./components/** -Destination $componentDir -Include **
# Copy-Item -Path ./home/** -Destination $home -Include **

# Remove-Variable componentDir
# Remove-Variable profileDir

# ------------------------------------ [END] ------------------------------------ #
