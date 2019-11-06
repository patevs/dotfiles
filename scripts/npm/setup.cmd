@ECHO OFF

:: --------------------- ::
:: scripts/npm/setup.cmd ::
:: --------------------- ::

:: Script to setup npm global configuation.
:: Requires npm to be installed.

:: Resources:
::  https://docs.npmjs.com/cli/config
::  https://docs.npmjs.com/files/npmrc
::  https://stackoverflow.com/questions/51330735/npm-config-global-vs-local

:: CLS
ECHO. & ECHO  [100m [100;4mNPM Global Configuration Setup Script[0m[100m [0m

:: Verify NPM is installed & can be found
ECHO. & ECHO [92m Verifying NPM Installation... [0m
ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.
WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

:: Begin NPM Global Configuration Setup
ECHO. & ECHO [92m All Requirements Satisfied! Starting NPM Global Configuration Setup... [0m
:: & ECHO.

ECHO. & ECHO  [44m Setting NPM Global Configuration [0m & ECHO.

:: Set Username and email
:: ECHO [92m Setting Username and Email. [0m & ECHO.

CALL npm config set --global init.author.email "ppevans11@gmail.com"
CALL npm config set --global init.author.name "PatEvs"
CALL npm config set --global init.author.url "https://github.com/patevs"
CALL npm config set --global init.license "MIT"

:: Print NPM global configuration
ECHO [42m NPM Global Configuration: [0m & ECHO.

CALL npm config list --global

ECHO. & ECHO  [42m Done! [0m & ECHO.

GOTO :EOF

:: EOF ::
