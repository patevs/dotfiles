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

# Hermes Engine
Set-Environment "HERMES_WS_DIR"  "C:\Users\Pat\git\dev\hermes_ws"

# JDK
Set-Environment "JAVA_HOME" "C:\Program Files\Java\jdk1.8.0_211"

# MSBuild
Set-Environment "MSBUILD_HOME" "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current"

# Watchman
Set-Environment "WATCHMAN_HOME" "C:\tools\watchman"

# Make Neovim the default editor
Set-Environment "EDITOR" "nvim"
Set-Environment "GIT_EDITOR" $Env:EDITOR

# Update Path
AppendEnvPath "$env:ANDROID_HOME\platform-tools"
AppendEnvPath "$env:ANDROID_HOME\emulator"
AppendEnvPath "$env:CODE_HOME\bin"
AppendEnvPath "$env:GIT_HOME\bin"
AppendEnvPath "$env:GIT_HOME\cmd"
AppendEnvPath "$env:JAVA_HOME\bin"
AppendEnvPath "$env:MSBUILD_HOME\bin"
AppendEnvPath "$env:WATCHMAN_HOME\bin"

# Disable the Progress Bar
# $ProgressPreference='SilentlyContinue'

# EOF #
