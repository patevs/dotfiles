@ECHO OFF

:: alacritty/install.cmd
:: ---------------------

:: Batch script for easily setting up my alacritty terminal configuration
:: The script copies `alacritty.yml` to `%USERPROFILE%\APPDATA\Roaming\alacritty\alacritty.yml`

:: CLS
ECHO. & ECHO  [100;4m Alacritty Terminal Configuration Script [0m & ECHO.

:: Copy Alacritty configuration
CALL ECHO F | xcopy /Y /Q alacritty.yml %USERPROFILE%\APPDATA\Roaming\alacritty\alacritty.yml
:: Reload Alacritty
CALL alacritty

:: ECHO. & ECHO  [42m Done! [0m4w nmhygtrf desqDFQW X

GOTO :EOF
