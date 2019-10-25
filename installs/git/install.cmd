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

:: Check if diff-so-fancy is installed
:: CALL npm list --global --depth=0 | findstr diff-so-fancy
:: Install diff-so-fancy module
:: ECHO  [44m Installing diff-so-fancy Module: [0m & ECHO.
:: TODO: Check if diff-so-fancy is already installed
:: CALL npm install --global diff-so-fancy

REM :: ECHO  [44m Setting git Global Configuration: [0m & ECHO.

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

