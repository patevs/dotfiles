@ECHO OFF

:: ---------------------------------- ::
:: config/WindowsTerminal/install.cmd ::
:: ---------------------------------- ::

:: Batch script used for applying my WindowsTerminal profile.
:: This script copies `profiles.json` to:
::  "%USERPROFILE%\AppData\Local\Microsoft\Windows Terminal\profiles.json"

:: CLS
ECHO. & ECHO  [100m [100;4mWindows Terminal Profile Install Script[0m[100m [0m & ECHO.

:: Copy profile
CALL ECHO F | xcopy /Y /Q profiles.json "%USERPROFILE%\APPDATA\Local\Microsoft\Windows Terminal\profiles.json"

:: New line
ECHO.
:: Reload WindowsTerminal
:: CALL powershell -nologo
:: CALL windowsterminal.exe
CALL windowsterminal

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
