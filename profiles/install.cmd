@ECHO OFF
REM Script to setup powershell profile 
REM Copyies ps-profile.ps1 to $PROFILE (~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1).

:: CLS
ECHO. & ECHO [100;4mPowerShell Profile Install Script[0m

:: Copy powershell profile
CALL cp ps-profile.ps1 $PROFILE
:: Reload powershell
CALL powershell 

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

