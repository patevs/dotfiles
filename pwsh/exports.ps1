# ----------- #
# exports.ps1 #
# ----------- #

# Write-Host "exports.ps1"

# Android SDK and NDK
Set-Environment "ANDROID_HOME" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK_ROOT" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_NDK" "C:\Users\Pat\AppData\Local\Android\Sdk\ndk\21.1.6352462"

# VSCode
Set-Environment "CODE_HOME" "C:\Program Files\Microsoft VS Code"

# Git
Set-Environment "GIT_HOME" "C:\Program Files\Git"

# Hermes
Set-Environment "HERMES_WS_DIR"  "C:\Users\Pat\git\dev\hermes_ws"

# Java
# Set-Environment "JAVA_HOME" "..."

# MSBuild
Set-Environment "MSBUILD" "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin"

# Make Neovim the default editor
Set-Environment "EDITOR" "nvim"
Set-Environment "GIT_EDITOR" $Env:EDITOR

# Update Path
AppendEnvPath "$env:ANDROID_HOME\platform-tools"
AppendEnvPath "$env:ANDROID_HOME\emulator"
AppendEnvPath "$env:CODE_HOME\bin"
AppendEnvPath "$env:GIT_HOME\bin"
AppendEnvPath "$env:GIT_HOME\cmd"
AppendEnvPath "$env:MSBUILD"

# Disable the Progress Bar
# $ProgressPreference='SilentlyContinue'

# EOF #
