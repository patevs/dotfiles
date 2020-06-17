# ----------- #
# exports.ps1 #
# ----------- #

# Write-Host "exports.ps1"

# Pager
Set-Environment "PAGER" "less -RFSX"

Set-Environment "BAT_PAGER" "less -RFSX"
# https://github.com/sharkdp/bat/issues/860#issuecomment-624088510
Set-Environment "BAT_STYLE" "numbers,plain"

# Android SDK and NDK
# TODO: Use HOME environment variable instead of absolute path
Set-Environment "ANDROID_HOME" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK_ROOT" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_NDK" "C:\Users\Pat\AppData\Local\Android\Sdk\ndk\21.3.6528147"

# VSCode
Set-Environment "CODE_HOME" "C:\Program Files\Microsoft VS Code"

# Git
Set-Environment "GIT_HOME" "C:\Program Files\Git"

# JDK
Set-Environment "JAVA_HOME" "C:\Program Files\Java\jdk1.8.0_211"

# MSBuild
# Set-Environment "MSBUILD_HOME" "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current"

# Python Output Encoding
# Set-Environment "PYTHONIOENCODING" "utf-8"

# Make Neovim the default editor
# Set-Environment "EDITOR" "nvim"
# Set-Environment "GIT_EDITOR" $Env:EDITOR

# Update Path Environment Variable
AppendEnvPath "$env:ANDROID_HOME\platform-tools"
AppendEnvPath "$env:ANDROID_HOME\emulator"
AppendEnvPath "$env:CODE_HOME\bin"
AppendEnvPath "$env:GIT_HOME\bin"
AppendEnvPath "$env:GIT_HOME\cmd"
AppendEnvPath "$env:JAVA_HOME\bin"
# AppendEnvPath "$env:MSBUILD_HOME\bin"

# Disable the Progress Bar
# $ProgressPreference='SilentlyContinue'

# EOF #
