@ECHO OFF

:: ---------------------- ::
:: config/ps1/install.cmd ::
:: ---------------------- ::

:: Batch script for easily setting up my PowerShell profile
:: The script copies profile scripts to ~\Documents\WindowsPowerShell\
:: and then reloads PowerShell to activate the profile.

:: CLS
ECHO. & ECHO  [100;4m PowerShell Profile Install Script [0m & ECHO.

:: Copy PowerShell profile scripts
CALL ECHO F | xcopy /Y Microsoft.PowerShell_profile.ps1 C:\Users\Patrick\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
CALL ECHO F | xcopy /Y defaults.ps1 C:\Users\Patrick\Documents\WindowsPowerShell\defaults.ps1
CALL ECHO F | xcopy /Y unix.ps1 C:\Users\Patrick\Documents\WindowsPowerShell\unix.ps1
CALL ECHO F | xcopy /Y development.ps1 C:\Users\Patrick\Documents\WindowsPowerShell\development.ps1
:: New line
ECHO.
:: Reload PowerShell
CALL powershell -nologo

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
