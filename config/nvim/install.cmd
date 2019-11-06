@ECHO OFF

:: ----------------------- ::
:: config/nvim/install.cmd ::
:: ----------------------- ::

:: Batch script for easily setting up my neovim configuration
:: The script copies profile scripts to ~\APPDATA\Local\nvim\init.vim

:: CLS
ECHO. & ECHO  [100;4m NeoVim Profile Install Script [0m & ECHO.

:: Copy vim profile scripts
CALL ECHO F | xcopy /Y /Q init.vim C:\Users\Patrick\APPDATA\Local\nvim\init.vim
:: New line
ECHO.

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
