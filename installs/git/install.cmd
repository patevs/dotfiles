@ECHO OFF

:: ------------------------ ::
:: installs/git/install.cmd ::
:: ------------------------ ::

REM Script to install setup git global configuation.
REM Requires Git and diff-so-fancy to be installed.
REM Perl, Node.js, and NPM installations are also required.

CLS
ECHO. & ECHO [100;4mGit Global Configuration Setup Script[0m

REM Verify Git is installed & can be found
ECHO. & ECHO [92m Verifying Git Installation... [0m
ECHO. & ECHO  [45m Git Installation: [0m & ECHO.
WHERE git
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m git installation could not be found... exiting! [0m & GOTO :EOF

REM Begin git Global Configuration Setup
ECHO. & ECHO [92m All Requirements Satisfied! Starting Git Global Configuration Setup... [0m & ECHO.

:: Check if diff-so-fancy is installed
ECHO. & ECHO [92m Verifying Diff-So-Fancy Installation... [0m
ECHO. & ECHO  [45m Diff-So-Fancy Installation: [0m & ECHO.
WHERE diff-so-fancy
IF %ERRORLEVEL% NEQ 0 (
  ECHO. & ECHO [91m diff-so-fancy installation could not be found... Installing now: [0m
) ELSE (
  GOTO :GitConfig
)

:InstallDiffSoFancy
:: Verify Perl, NodeJS, and NPM installations
ECHO. & ECHO  [45m Perl Installation: [0m & ECHO.
WHERE perl
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m Perl installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NodeJS Installation: [0m & ECHO.
WHERE node
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m NodeJS installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.
WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

:GitConfig
ECHO. & ECHO  [44m Setting Git Global Configuration: [0m & ECHO.

:: diff-so-fancy --version
:: CALL npm list --global --depth=0 | findstr diff-so-fancy
:: Install diff-so-fancy module
:: ECHO  [44m Installing diff-so-fancy Module: [0m & ECHO.
:: TODO: Check if diff-so-fancy is already installed
:: CALL npm install --global diff-so-fancy

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

