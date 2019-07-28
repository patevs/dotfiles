@ECHO OFF
REM Script to install mps-youtube
REM Requires Python3 and pip to be installed

CLS
ECHO. & ECHO [92m Installing MPS-YouTube and Required Dependencies... [0m & ECHO.

REM Install dependencies
CALL python -m pip install colorama
CALL python -m pip install youtube_dl

REM Install mps-youtube

CALL python -m pip install mps-youtube

ECHO. & ECHO [92m Finished Installing MPS-YouTube and Required Dependencies! [0m & ECHO.

REM Set mpsyt configuartion
REM CALL mpsyt set order views
REM CALL mpsyt set encoder 3
REM CALL mpsyt set columns user:14 date rating views likes dislikes category:9

REM Print pip installs

ECHO [96m pip installs: [0m & ECHO.

CALL python -m pip list

ECHO. & ECHO [92m Done! [0m & ECHO.

GOTO :EOF