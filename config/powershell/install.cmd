@ECHO OFF

:: ----------------------------- ::
:: config/PowerShell/install.cmd ::
:: ----------------------------- ::

:: Batch script for easily setting up my PowerShell profile
:: The script copies `ps-profile.ps1` to $PROFILE (~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1)
:: and then reloads PowerShell to activate the profile.

:: CLS
ECHO. & ECHO  [100;4m PowerShell Profile Install Script [0m & ECHO.

:: Copy PowerShell profile
:: CALL cp ps-profile.ps1 $PROFILE
CALL xcopy /Y ps-profile.ps1 C:\Users\Patrick\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
:: Reload PowerShell
CALL powershell

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
