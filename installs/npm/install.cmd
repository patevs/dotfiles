:: REM install.cmd 
:: REM NPM global installs script

@echo OFF
echo Running NPM global installs script!

REM # Unless already being reinvoked via cmd.exe, see if the batch
REM # file is being run from PowerShell.
IF NOT %1.==_isNew. echo %PSModulePath% | findstr %USERPROFILE% >NUL
REM # If so, RE-INVOKE this batch file in a NEW cmd.exe console WINDOW.
:: REM IF NOT %1.==_isNew. IF %ERRORLEVEL% EQU 0 start "With Environment" "%~f0" _isNew & goto :EOF

echo Running from cmd.exe, setting environment variables...

REM # Set environment variables.
SET MyEnvVariable=MyValue
REM # Do some stuff...


REM # If the batch file had to be reinvoked because it was run from PowerShell,
REM # but you want the user to retain the PowerShell experience,
REM # restart PowerShell now, after definining the env. variables.
:: REM IF %1.==_isNew. powershell.exe

GOTO :EOF