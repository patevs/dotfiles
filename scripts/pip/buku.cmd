@ECHO OFF

:: -------------------- ::
:: scripts/pip/buku.cmd ::
:: -------------------- ::

:: Batch script used to install buku and required dependencies.
:: Requires Python and PIP to be installed.

:: CLS
ECHO. & ECHO  [100m [100;4mBuku Install Script[0m[100m [0m

:: Verify Python and PIP are installed & can be found
ECHO. & ECHO [92m Verifying Python and PIP Installations... [0m

ECHO. & ECHO  [45m Python Installation: [0m & ECHO.
WHERE python
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m Python installation could not be found... exiting! [0m & GOTO :EOF

:: print python vesion
:: CALL python -V

ECHO. & ECHO  [45m PIP Installation: [0m & ECHO.
WHERE pip
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m PIP installation could not be found... exiting! [0m & GOTO :EOF

:: print pip vesion
:: CALL pip -V

:: Begin install
ECHO. & ECHO [92m All Requirements Satisfied! Beginning Install... [0m
:: & ECHO.

GOTO :EOF

:: ---------------------------------------------------------------------------- ::

ECHO. & ECHO  [44m Installing Buku and Required Dependencies: [0m & ECHO.

:: Install buku required dependencies
:: python -m pip install certifi urllib3 cryptography beautifulsoup4

:: Install buku
:: CALL python -m pip install buku

:: Install bukuserver required dependencies
:: CALL python -m pip install flask flask_admin flask_api flask_bootstrap flask_paginate flask_wtf arrow

:: ---------------------------------------------------------------------------- ::

ECHO. & ECHO [92m Finished Installing Buku! [0m & ECHO.

:: Print Buku version
ECHO  [44m Buku version: [0m & ECHO.

CALL buku --version

:: Print BukuServer version
ECHO  [44m BukuServer version: [0m & ECHO.

:: CALL bukuserver --version

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
