@ECHO OFF
REM Script to check the status of all git repositories in a given directory
REM Requires Git to be installed

REM Verify Git is installed

CLS
ECHO. & ECHO [92m Verifying Git Installation... [0m 

ECHO. & ECHO [96m Found Git Installation: [0m & ECHO.

WHERE git
IF %ERRORLEVEL% NEQ 0 ECHO git installation wasn't found... exiting! & GOTO :EOF

REM Begin check status script

ECHO. & ECHO [92m Requirements Satisfied! Checking Git Status of all Directories... [0m & ECHO.

CALL dir

ECHO [92m Done! [0m & ECHO.

GOTO :EOF