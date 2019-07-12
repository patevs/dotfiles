@ECHO OFF
REM Script to install global NPM modules
REM Requires Node.js and NPM to be installed

CLS
ECHO. & ECHO [92m Installing NPM Global Modules... [0m & ECHO.

REM Linting and style check

CALL npm install --global eslint
CALL npm install --global jshint

REM Git integrations

CALL npm install --global g3l
CALL npm install --global git-open
CALL npm install --global gitmoji-cli

REM Utilities

CALL npm install --global fkill-cli
CALL npm install --global ntl
CALL npm install --global open-cli
CALL npm install --global spaceholder
CALL npm install --global trash-cli
CALL npm install --global wifi-password-cli

REM Yeoman and generators

CALL npm install --global yo
CALL npm install --global generator-nm

REM Package Managers

CALL npm install --global yarn
CALL npm install --global pnpm

REM Upgrade pnpm

CALL pnpm install --global pnpm

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

REM Print NPM global installs

ECHO [96m NPM Global Installs: [0m & ECHO.

CALL npm list --global --depth=0

ECHO [92m Done! [0m & ECHO.

GOTO :EOF