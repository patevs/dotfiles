# ----------- #
# exports.ps1 #
# ----------- #

# Write-Host "exports.ps1"

Set-Environment "ANDROID_HOME" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK_ROOT" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_NDK" "C:\Users\Pat\AppData\Local\Android\Sdk\ndk\21.1.6352462"

Set-Environment "CODE_HOME" "C:\Program Files\Microsoft VS Code"

Set-Environment "GIT_HOME" "C:\Program Files\Git"

Set-Environment "HERMES_WS_DIR"  "C:\Users\Pat\git\dev\hermes_ws"

# Set-Environment "JAVA_HOME" "..."

# MSBuild
# C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin

# TODO: Add to path:
# ANDROID_HOME\platform-tools
# ANDROID_HOME\emulator
# CODE_HOME\bin
# GIT_HOME\bin
# GIT_HOME\cmd

# Make vim the default editor
# Set-Environment "EDITOR" "gvim --nofork"
# Set-Environment "GIT_EDITOR" $Env:EDITOR

# Disable the Progress Bar
# $ProgressPreference='SilentlyContinue'

# EOF #
