@ECHO OFF

:: ------------------------- ::
:: scripts/choco/install.cmd ::
:: ------------------------- ::

:: Batch script which installs various chocolately packages.
:: Requires chocolately to be installed.

CLS
ECHO. & ECHO [100;4mChocolately Packages Install Script[0m

:: Verify chocolately is installed & can be found
ECHO. & ECHO [92m Verifying Chocolately Installation... [0m

ECHO. & ECHO  [45m Chocolately Installation: [0m & ECHO.
WHERE choco
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m choco installation could not be found... exiting! [0m & GOTO :EOF

:: Begin install
ECHO. & ECHO [92m All Requirements Satisfied! Installing Chocolately Packages... [0m
:: & ECHO.

:: ---------------------------------------------------------------------------- ::

:: Python2
ECHO  [44m Installing Python2: [0m & ECHO.
CALL choco install python2 --params '"/InstallDir:C:\bin\python2"'

:: ---------------------------------------------------------------------------- ::

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
