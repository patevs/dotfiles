@ECHO OFF

:: --------------------- ::
:: scripts/git/setup.cmd ::
:: --------------------- ::

REM Script to setup git global configuation.
REM Requires Git and diff-so-fancy to be installed.
REM Perl, Node.js, and NPM installations are also required.

CLS
ECHO. & ECHO [100;4mGit Global Configuration Setup Script[0m

REM Verify Git is installed & can be found
ECHO. & ECHO [92m Verifying Git Installation... [0m
ECHO. & ECHO  [45m Git Installation: [0m & ECHO.
WHERE git
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m git installation could not be found... exiting! [0m & GOTO :EOF

REM Begin git Global Configuration Setup
ECHO. & ECHO [92m All Requirements Satisfied! Starting Git Global Configuration Setup... [0m & ECHO.

:: Check if diff-so-fancy is installed
:: ECHO. &
ECHO [92m Verifying Diff-So-Fancy Installation... [0m
ECHO. & ECHO  [45m Diff-So-Fancy Installation: [0m & ECHO.
WHERE diff-so-fancy
IF %ERRORLEVEL% NEQ 0 (
  ECHO. & ECHO [91m diff-so-fancy installation could not be found...[0m [92m Installing now: [0m
) ELSE (
  GOTO :GitConfig
)

:InstallDiffSoFancy
:: Verify Perl, NodeJS, and NPM installations
ECHO. & ECHO  [45m Perl Installation: [0m & ECHO.
WHERE perl
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m Perl installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NodeJS Installation: [0m & ECHO.
WHERE node
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m NodeJS installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.
WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

:: Install diff-so-fancy module
ECHO. & ECHO  [44m Installing diff-so-fancy Module: [0m & ECHO.
CALL npm install --global diff-so-fancy

:GitConfig
ECHO. & ECHO  [44m Setting Git Global Configuration [0m & ECHO.

:: Set Username and email
ECHO [92m Setting Username and Email. [0m & ECHO.

CALL git config --global user.email "ppevans11@gmail.com"
CALL git config --global user.name "PatEvs"
CALL git config --global github.user "PatEvs"

:: Set up a submodule-aware status
:: ECHO [92m Setting submodule-aware status. [0m & ECHO.
:: CALL git config --global status.submoduleSummary true

ECHO  [44m Setting Diff-So-Fancy Configuration [0m & ECHO.

:: Set git-diff ui colors and configuration
ECHO [92m Setting git-diff UI Color and Configuration. [0m & ECHO.

CALL git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
CALL git config --global color.ui true
CALL git config --global color.diff-highlight.oldNormal    "red bold"
CALL git config --global color.diff-highlight.oldHighlight "red bold 52"
CALL git config --global color.diff-highlight.newNormal    "green bold"
CALL git config --global color.diff-highlight.newHighlight "green bold 22"
CALL git config --global color.diff.meta       "11"
CALL git config --global color.diff.frag       "magenta bold"
CALL git config --global color.diff.commit     "yellow bold"
CALL git config --global color.diff.old        "red bold"
CALL git config --global color.diff.new        "green bold"
CALL git config --global color.diff.whitespace "red reverse"

ECHO [44m Git Global Configuration: [0m & ECHO.

CALL git config --global --list

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF

