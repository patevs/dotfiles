@ECHO OFF

:: ---------------------- ::
:: config/vim/install.cmd ::
:: ---------------------- ::

:: Batch script for easily setting up my vim/neovim configuration
:: The script copies profile scripts to ~\APPDATA\Local\nvim\init.vim
:: and then reloads PowerShell to activate the profile.

:: CLS
ECHO. & ECHO  [100;4m Vim Profile Install Script [0m & ECHO.

:: Copy vim profile scripts
CALL xcopy /Y init.vim C:\Users\Patrick\APPDATA\Local\nvim\init.vim
:: New line
ECHO.
:: Reload PowerShell
CALL powershell -nologo

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
