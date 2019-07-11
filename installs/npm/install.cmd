@ECHO OFF
REM Script to install global NPM modules
REM Requires Node.js and NPM to be installed

cls
ECHO. & ECHO [92m Installing NPM Global Modules... [0m & ECHO.

REM Linting and style check

call npm install --global eslint
call npm install --global jshint

REM Git integrations

call npm install --global g3l
call npm install --global git-open
call npm install --global gitmoji-cli

REM Utilities

call npm install --global fkill-cli
call npm install --global ntl
call npm install --global open-cli
call npm install --global spaceholder
call npm install --global trash-cli
call npm install --global wifi-password-cli

REM Yeoman and generators

call npm install --global yo
call npm install --global generator-nm

REM Package Managers

call npm install --global yarn
call npm install --global pnpm

REM Upgrade pnpm

call pnpm install --global pnpm

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

REM Print NPM global installs

ECHO [96m NPM Global Installs: [0m & ECHO.

call npm list --global --depth=0

ECHO [92m Done! [0m & ECHO.

GOTO :EOF