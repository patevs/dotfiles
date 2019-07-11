
REM Script to install global NPM modules
REM Requires Node.js and NPM to be installed

@ECHO OFF
ECHO Installing NPM global modules...

REM Linting and style check
npm install --global eslint
npm install --global jshint

REM Git integrations
npm install --global g3l
npm install --global git-open
npm install --global gitmoji-cli

REM Utilities
npm install --global fkill-cli
npm install --global ntl
npm install --global open-cli
npm install --global spaceholder
npm install --global trash-cli
npm install --global wifi-password-cli

REM Yeoman and generators
npm install --global yo
npm install --global generator-nm

REM Package Managers
npm install --global yarn
npm install --global pnpm

REM Update pnpm
pnpm install --global pnpm

ECHO DONE!

GOTO :EOF