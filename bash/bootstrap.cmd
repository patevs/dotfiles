@ECHO OFF

:: ------------------ ::
:: bash/bootstrap.cmd ::
:: ------------------ ::

:: Batch script for easily setting up my bash configuration
:: The script copies '.bash_aliases', '.bash_profile', '.bashrc', and '.profile'
:: into my home directory.

:: CLS
ECHO. & ECHO  [100;4m Bash Profile Bootstrap Script [0m & ECHO.

:: TODO: Ensure wget is installed
CALL wget https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh -O ~/.git-prompt.sh
:: curl https://raw.githubusercontent.com/lyze/posh-git-sh/master/git-prompt.sh -o ~/.git-prompt.sh

:: Copy bash configuration files
CALL ECHO F | xcopy /Y /Q .bash_aliases %USERPROFILE%\.bash_aliases
CALL ECHO F | xcopy /Y /Q .bash_profile %USERPROFILE%\.bash_profile
CALL ECHO F | xcopy /Y /Q .bashrc %USERPROFILE%\.bashrc
CALL ECHO F | xcopy /Y /Q .profile %USERPROFILE%\.profile

:: Reload bash
CALL bash

:: ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

:: EOF ::
