@ECHO OFF
REM Script to install global NPM modules
REM Requires Node.js and NPM to be installed

REM Verify Node.js and NPM are installed

CLS
ECHO. & ECHO [92m Verifying NodeJS and NPM Installations... [0m

ECHO. & ECHO [96m NodeJS Installation: [0m & ECHO.

WHERE node
IF %ERRORLEVEL% NEQ 0 ECHO node installation wasn't found... exiting! & GOTO :EOF

ECHO. & ECHO [96m NPM Installation: [0m & ECHO.

WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO npm installation wasn't found... exiting! & GOTO :EOF

REM Begin install script

ECHO. & ECHO [92m Requirements Satisfied! Installing NPM Global Modules... [0m & ECHO.

REM Linting and style check

ECHO [96m Installing Linting and Style Check Modules: [0m & ECHO.

CALL npm install --global eslint
CALL npm install --global jshint

REM Git integrations

ECHO. & ECHO [96m Installing Git Integration Modules: [0m & ECHO.

CALL npm install --global g3l
CALL npm install --global git-open
CALL npm install --global gitmoji-cli

REM Utilities

ECHO. & ECHO [96m Installing Utility Modules: [0m & ECHO.

CALL npm install --global fkill-cli
CALL npm install --global ntl
CALL npm install --global open-cli
CALL npm install --global spaceholder
CALL npm install --global trash-cli
CALL npm install --global wifi-password-cli
CALL npm install --global david
CALL npm install --global jsome
CALL npm install --global typescript

REM Yeoman and generators

ECHO. & ECHO [96m Installing Yeoman and Generators: [0m & ECHO.

CALL npm install --global yo
CALL npm install --global generator-nm
CALL npm install --global generator-node
CALL npm install --global generator-node-typescript

REM Package Managers

ECHO. & ECHO [96m Installing Package Managers: [0m & ECHO.

CALL npm install --global yarn
CALL npm install --global pnpm

REM Upgrade pnpm

ECHO. & ECHO [96m Upgrading PNPM: [0m & ECHO.

CALL pnpm install --global pnpm

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

REM Print NPM global installs

ECHO [96m Listing NPM Global Installs: [0m & ECHO.

CALL npm list --global --depth=0

ECHO [92m Done! [0m & ECHO.

GOTO :EOF