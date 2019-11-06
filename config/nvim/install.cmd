@ECHO OFF

:: ----------------------- ::
:: config/nvim/install.cmd ::
:: ----------------------- ::

:: Batch script for easily setting up my neovim configuration
:: The script copies `init.vim` to `~\APPDATA\Local\nvim\init.vim`

:: CLS
ECHO. & ECHO  [100m [100;4mNeoVim Profile Install Script[0m[100m [0m

:: Copy neovim profile
CALL ECHO F | xcopy /Y /Q init.vim C:\Users\Patrick\APPDATA\Local\nvim\init.vim
:: New line
ECHO.

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
