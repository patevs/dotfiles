# ----------- #
# exports.ps1 #
# ----------- #

# TODO: Add exports for;

# ANDROID_HOME, ANDROID_SDK, ANDROID_SDK_ROOT, ANDROID_NDK
# CODE_HOME
# GIT_HOME
# JAVA_HOME

Set-Environment "TEST_VAR" "C:\Users\Pat"

Set-Environment "ANDROID_HOME" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_SDK_ROOT" "C:\Users\Pat\AppData\Local\Android\Sdk"
Set-Environment "ANDROID_NDK" "C:\Users\Pat\AppData\Local\Android\Sdk\ndk\21.1.6352462"

Set-Environment "CODE_HOME" "C:\Program Files\Microsoft VS Code"

Set-Environment "GIT_HOME" "C:\Program Files\Git"

Set-Environment "HERMES_WS_DIR"  "C:\Users\Pat\git\dev\hermes_ws"

# Make vim the default editor
# Set-Environment "EDITOR" "gvim --nofork"
# Set-Environment "GIT_EDITOR" $Env:EDITOR

# Disable the Progress Bar
# $ProgressPreference='SilentlyContinue'

# EOF #
