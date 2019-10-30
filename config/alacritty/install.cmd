@ECHO OFF

:: ---------------------------- ::
:: config/alacritty/install.cmd ::
:: ---------------------------- ::

:: Batch script for easily setting up my alacritty terminal configuration
:: The script copies `alacritty.yml` to ~\APPDATA\Roaming\alacritty\alacritty.yml

:: CLS
ECHO. & ECHO  [100;4m Alacritty Terminal Configuration Script [0m & ECHO.

:: Copy Alacritty configuration
CALL xcopy /Y alacritty.yml C:\Users\Patrick\APPDATA\Roaming\alacritty\alacritty.yml
:: Reload Alacritty
CALL alacritty
:: Close previous alacritty instance
:: CALL exit

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
