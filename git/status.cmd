@ECHO OFF
REM Script to check the status of all git repositories in a given directory
REM Requires Git to be installed

REM Verify Git is installed

CLS
ECHO. & ECHO [92m Verifying Git Installation... [0m 

ECHO. & ECHO [96m Found Git Installation: [0m & ECHO.

WHERE git
IF %ERRORLEVEL% NEQ 0 ECHO git installation wasn't found... exiting! & GOTO :EOF

ECHO [92m Done! [0m & ECHO.

GOTO :EOF