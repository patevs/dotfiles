@ECHO OFF

:: ------------------------- ::
:: scripts/music/install.cmd ::
:: ------------------------- ::

:: Batch script used to install mpsyt & beets along with their dependencies.
:: Requires Python and PIP to be installed.

CLS
:: ECHO. & ECHO [100;4mMpsyt and Beets Install Script [0m
ECHO. & ECHO  [100m [100;4mMpsyt and Beets Install Script[0m[100m [0m

:: Verify Python and PIP are installed & can be found
ECHO. & ECHO [92m Verifying Python and PIP Installations... [0m

ECHO. & ECHO  [45m Python Installation: [0m & ECHO.
WHERE python
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m Python installation could not be found... exiting! [0m & GOTO :EOF

:: TODO: print python vesion

ECHO. & ECHO  [45m PIP Installation: [0m & ECHO.
WHERE pip
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m PIP installation could not be found... exiting! [0m & GOTO :EOF

:: TODO: print pip vesion

:: Begin install
ECHO. & ECHO [92m All Requirements Satisfied! Installing Mpsyt and Beets... [0m
:: & ECHO.

:: ---------------------------------------------------------------------------- ::

:: Git Integrations and Utilities
:: ECHO. & ECHO  [44m Installing Git Integration and Utility Modules: [0m & ECHO.

:: ...

:: ---------------------------------------------------------------------------- ::

ECHO. & ECHO [92m Finished Installing Mpsyt and Beets! [0m & ECHO.

:: Print NPM global installs
:: ECHO  [44m Listing NPM Global Installs: [0m & ECHO.
:: CALL npm list --global --depth=0

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
