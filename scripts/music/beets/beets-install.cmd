@ECHO OFF
REM Script to install beets along with required dependencies
REM Requires Python3 and pip to be installed

CLS
ECHO. & ECHO [92m Installing Beets and Required Dependencies... [0m & ECHO.

REM Install beets
CALL python -m pip install beets

REM Install required dependencies

CALL python -m pip install discogs-client
CALL python -m pip install pylast

ECHO. & ECHO [92m Finished Installing Beets and Required Dependencies! [0m & ECHO.

REM Print pip installs

ECHO [96m pip installs: [0m & ECHO.

CALL python -m pip list

ECHO. & ECHO [92m Done! [0m & ECHO.

GOTO :EOF