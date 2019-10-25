@ECHO OFF

:: ------------------------ ::
:: installs/git/install.cmd ::
:: ------------------------ ::

REM Script to install setup git global configuation.
REM Requires Git, Node.js, and NPM to be installed.

CLS
ECHO. & ECHO [100;4mGit Global Configuration Setup Script[0m
REM Verify Git, Node.js, and NPM are installed & can be found
ECHO. & ECHO [92m Verifying Git, NodeJS, and NPM Installations... [0m

ECHO. & ECHO  [45m Git Installation: [0m & ECHO.
WHERE git
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m git installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NodeJS Installation: [0m & ECHO.
WHERE node
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m NodeJS installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.
WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

REM Begin git configuration setup
ECHO. & ECHO [92m All Requirements Satisfied! Starting Git Global Configuration Setup... [0m & ECHO.

REM :: ECHO  [44m Installing Just-For-Fun and Testing Modules: [0m & ECHO.

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

