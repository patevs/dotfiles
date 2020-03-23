@ECHO OFF

:: ---------------------- ::
:: config/ps1/install.cmd ::
:: ---------------------- ::

:: Batch script for easily setting up my PowerShell profile
:: The script copies profile scripts to '%USERPROFILE%\Documents\WindowsPowerShell\'
:: and then reloads PowerShell to activate the profile.

:: TODO: Create a .ps1 version of this script

:: CLS
ECHO. & ECHO  [100m [100;4mPowerShell Profile Install Script[0m[100m [0m & ECHO.
:: ECHO. & ECHO  [100;4m PowerShell Profile Install Script [0m & ECHO.

:: TODO: Update script to dynamically find all config files

:: Copy PowerShell profile scripts
CALL ECHO F | xcopy /Y /Q Microsoft.PowerShell_profile.ps1 %USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
CALL ECHO F | xcopy /Y /Q defaults.ps1 %USERPROFILE%\Documents\WindowsPowerShell\defaults.ps1
CALL ECHO F | xcopy /Y /Q unix.ps1 %USERPROFILE%\Documents\WindowsPowerShell\unix.ps1
CALL ECHO F | xcopy /Y /Q development.ps1 %USERPROFILE%\Documents\WindowsPowerShell\development.ps1
CALL ECHO F | xcopy /Y /Q completions\rustup.ps1 %USERPROFILE%\Documents\WindowsPowerShell\completions\rustup.ps1
:: New line
ECHO.
:: Reload PowerShell
CALL powershell -nologo

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
