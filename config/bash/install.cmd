@ECHO OFF

:: ----------------------- ::
:: config/bash/install.cmd ::
:: ----------------------- ::

:: Batch script for easily setting up my bash configuration
:: The script copies '.bash_aliases', '.bash_profile', '.bashrc', and '.profile'
:: into my home directory.

:: CLS
ECHO. & ECHO  [100;4m Bash Configuration Script [0m & ECHO.

:: Copy bash configuration files
CALL ECHO F | xcopy /Y .bash_aliases C:\Users\Patrick\.bash_aliases
CALL ECHO F | xcopy /Y .bash_profile C:\Users\Patrick\.bash_profile
CALL ECHO F | xcopy /Y .bashrc C:\Users\Patrick\.bashrc
CALL ECHO F | xcopy /Y .profile C:\Users\Patrick\.profile

:: Reload bash
:: CALL bash

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

:: EOF ::
