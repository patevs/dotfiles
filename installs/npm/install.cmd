:: REM install.cmd 
:: REM NPM global installs script

@ECHO OFF
ECHO Running NPM global installs script!

REM # Unless already being reinvoked via cmd.exe, see if the batch
REM # file is being run from PowerShell.
IF NOT %1.==_isNew. echo %PSModulePath% | findstr %USERPROFILE% >NUL
REM # If so, RE-INVOKE this batch file in a NEW cmd.exe console WINDOW.
:: REM IF NOT %1.==_isNew. IF %ERRORLEVEL% EQU 0 start "With Environment" "%~f0" _isNew & goto :EOF

ECHO Running from cmd.exe, checking requirements...

ECHO Checking Node.js is installed:
REM # Get output of node --version
FOR /F "tokens=* USEBACKQ" %%F IN (`node --version`) DO (
  SET var=%%F
)

REM TODO: check output starts with v?

ECHO Node.js version: %var%
REM Check output wasnt empty
IF [%var%] == [] GOTO NodeNotInstalled

:: ECHO Checking NPM is installed:

:: echo Checking NPM version:
:: npm --version

GOTO :EOF

:NodeNotInstalled
echo Please install Node.js and rerun the script!

REM # If the batch file had to be reinvoked because it was run from PowerShell,
REM # but you want the user to retain the PowerShell experience,
REM # restart PowerShell now, after definining the env. variables.
:: REM IF %1.==_isNew. powershell.exe

GOTO :EOF