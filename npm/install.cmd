@ECHO OFF
REM Script to install useful NPM global modules.
REM Requires Node.js and NPM to be installed.

CLS
ECHO. & ECHO [100;4mNPM Global Modules Install Script[0m

REM Verify Node.js and NPM are installed & can be found

ECHO. & ECHO [92m Verifying NodeJS and NPM Installations... [0m

ECHO. & ECHO  [45m NodeJS Installation: [0m & ECHO.

WHERE node
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m NodeJS installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.

WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

REM Begin install

ECHO. & ECHO [92m All Requirements Satisfied! Installing NPM Global Modules... [0m & ECHO.

REM Linting and Style Check

REM :: ECHO  [44m Installing Linting and Style Check Modules: [0m & ECHO.

REM :: CALL npm install --global eslint
REM :: CALL npm install --global jshint

REM Git Integrations and Utilities

ECHO. & ECHO  [44m Installing Git Integration and Utility Modules: [0m & ECHO.

CALL npm install --global g3l
CALL npm install --global git-open
CALL npm install --global add-gitignore
REM :: CALL npm install --global gitmoji-cli
REM :: CALL npm install --global git-labelmaker
REM :: CALL npm install --global lint-staged

REM NodeJS Utilities

ECHO. & ECHO  [44m Installing NodeJS Utility Modules: [0m & ECHO.

CALL npm install --global ntl
CALL npm install --global david
CALL npm install --global npm-check-updates
REM :: CALL npm install --global pm2
REM :: CALL npm install --global npe
REM :: CALL npm install --global package-json-to-readme
REM :: CALL npm install --global cost-of-modules
REM :: CALL npm install --global npkill
REM :: CALL npm install --global how-to-npm
REM :: CALL npm install --global dependency-check
REM :: CALL npm install --global module-init
REM :: CALL npm install --global np
REM :: windows-build-tools install must be run in admin prompt
REM :: CALL npm install --global windows-build-tools
REM :: ndb requires windows-build-tools
REM :: CALL npm install --global ndb

REM TypeScript and Utilities

REM :: ECHO. & ECHO  [44m Installing TypeScript and Utility Modules: [0m & ECHO.

REM :: CALL npm install --global typescript
REM :: CALL npm install --global typesync
REM :: CALL npm install --global typed-install
REM :: CALL npm install --global typescript-starter

REM Development Utilities

REM :: ECHO. & ECHO  [44m Installing Development Utility Modules: [0m & ECHO.

REM :: CALL npm install --global stacks-cli
REM :: CALL npm install --global imagemin-cli
REM :: CALL npm install --global strapi@beta
REM :: CALL npm install --global create-react-app
REM :: CALL npm install --global licensed
REM :: CALL npm install --global viewport-list-cli
REM :: CALL npm install --global korkut
REM :: font-awesome-svg-png requires rsvg-convert to be on $PATH
REM :: CALL npm install --global font-awesome-svg-png
REM :: mobicon-cli depends on GraphicsMagick being installed
REM :: CALL npm install --global mobicon-cli
REM :: CALL npm install --global faviator
REM :: CALL npm install --global spaceholder
REM :: CALL npm install --global jsome

REM System Utilities

ECHO. & ECHO  [44m Installing System Utility Modules: [0m & ECHO.

CALL npm install --global trash-cli
CALL npm install --global empty-trash-cli
CALL npm install --global wifi-password-cli
REM :: CALL npm install --global open-cli
REM :: CALL npm install --global @rafaelrinaldi/whereami
REM :: CALL npm install --global fkill-cli

REM Yeoman and generators

ECHO. & ECHO  [44m Installing Yeoman and Generators: [0m & ECHO.

CALL npm install --global yo
REM HTML/Frontend
CALL npm install --global generator-h5bp
REM :: CALL npm install --global generator-webapp

REM JavaScript/Node
REM :: CALL npm install --global generator-nm
REM :: CALL npm install --global generator-node

REM Typescript
REM :: (Jest)
REM :: CALL npm install --global generator-node-typescript
REM :: (Ava)
REM :: CALL npm install --global generator-typescript-starter

REM Alternative Package Managers

REM :: ECHO. & ECHO  [44m Installing Alternative Package Managers: [0m & ECHO.

REM :: CALL npm install --global yarn
REM :: CALL npm install --global pnpm

REM Upgrade pnpm

REM :: ECHO. & ECHO  [44m Upgrading PNPM: [0m & ECHO.
REM :: CALL pnpm install --global pnpm

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

REM Print NPM global installs

ECHO  [44m Listing NPM Global Installs: [0m & ECHO.

CALL npm list --global --depth=0

REM Check for outdated modules

ECHO  [44m Checking for Outdated Modules: [0m & ECHO.

CALL david -g

ECHO  [42m Done! [0m & ECHO.

GOTO :EOF