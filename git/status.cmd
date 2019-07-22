@ECHO OFF
REM Script to check the status of all git repositories in a given directory
REM Requires Git to be installed

REM Verify Git is installed

CLS
ECHO. & ECHO [92m Verifying Git Installation... [0m 

ECHO. & ECHO [96m Git Installation: [0m & ECHO.

WHERE git
IF %ERRORLEVEL% NEQ 0 ECHO git installation wasn't found... exiting! & GOTO :EOF

REM Begin check status script

ECHO. & ECHO [92m Requirements Satisfied! Starting Check Git Status Script... [0m & ECHO.

ECHO [96m Moving into Git Projects Directory: [0m & ECHO.

cd %UserProfile%\Desktop\git

REM Echo current directory
SET CURRENTDIR="%cd%"
ECHO %CURRENTDIR%

ECHO. & ECHO [96m Listing Directory Contents: [0m & ECHO.

REM :: CALL dir /a:d /b
SET DIRCONTENTS = "dir /a:d /b"
ECHO %DIRCONTENTS%

ECHO. & ECHO [92m Done! [0m & ECHO.

GOTO :EOF