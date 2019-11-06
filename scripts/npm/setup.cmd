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
ECHO. & ECHO [100;4mNPM Global Configuration Setup Script[0m

:: Verify NPM is installed & can be found
ECHO. & ECHO [92m Verifying NPM Installation... [0m
ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.
WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

:: Begin NPM Global Configuration Setup
ECHO. & ECHO [92m All Requirements Satisfied! Starting NPM Global Configuration Setup... [0m & ECHO.

ECHO. & ECHO  [44m Setting NPM Global Configuration [0m & ECHO.

:: Set Username and email
:: ECHO [92m Setting Username and Email. [0m & ECHO.

:: CALL git config --global user.email "ppevans11@gmail.com"
:: CALL git config --global user.name "PatEvs"
:: CALL git config --global github.user "PatEvs"

:: ECHO  [44m Setting Diff-So-Fancy Configuration [0m & ECHO.

:: Print NPM global configuration
ECHO [44m NPM Global Configuration: [0m & ECHO.

CALL npm config list --global

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

:: EOF ::
