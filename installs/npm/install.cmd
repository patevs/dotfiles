@ECHO OFF

:: ------------------------ ::
:: installs/npm/install.cmd ::
:: ------------------------ ::

:: Batch script which installs various useful NPM global modules.
:: Requires NodeJS and NPM to be installed.

CLS
ECHO. & ECHO [100;4mNPM Global Modules Install Script[0m
:: Verify Node.js and NPM are installed & can be found
ECHO. & ECHO [92m Verifying NodeJS and NPM Installations... [0m
ECHO. & ECHO  [45m NodeJS Installation: [0m & ECHO.

WHERE node
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m NodeJS installation could not be found... exiting! [0m & GOTO :EOF

ECHO. & ECHO  [45m NPM Installation: [0m & ECHO.

WHERE npm
IF %ERRORLEVEL% NEQ 0 ECHO. & ECHO [91m npm installation could not be found... exiting! [0m & GOTO :EOF

:: Begin install
ECHO. & ECHO [92m All Requirements Satisfied! Installing NPM Global Modules... [0m & ECHO.

:: Just for fun, testing, or to be sorted
:: ECHO  [44m Installing Just-For-Fun and Testing Modules: [0m & ECHO.

:: # https://github.com/xxczaki/nasa-cli
:: CALL npm install --global nasa-cli
:: # https://github.com/mishoo/UglifyJS2
:: CALL npm install --global uglify-js
:: # https://github.com/sitespeedio/sitespeed.io
:: # https://github.com/lirantal/is-website-vulnerable
:: # https://github.com/webtorrent/webtorrent-cli
:: # NOTE: vtop must be run using sh/bash
:: # https://github.com/MrRio/vtop
:: # https://github.com/kangax/html-minifier
:: # https://github.com/ddopson/underscore-cli
:: # https://github.com/lordgiotto/google-font-installer
:: # https://github.com/riyadhalnur/weather-cli
:: # https://github.com/jhotmann/node-passgen-cli
:: # https://github.com/thlorenz/doctoc
:: # https://github.com/GitbookIO/gitbook
:: # https://github.com/marionebl/share-cli
:: # https://github.com/jhotmann/node-rename-cli
:: # https://github.com/IonicaBizau/cli-github
:: # https://github.com/mbostock/gistup
:: # https://github.com/voorhoede/lighthouse-security
:: # https://github.com/gillstrom/screensaver
:: # https://github.com/cezaraugusto/mklicense
:: # https://github.com/IonicaBizau/git-stats
:: # https://github.com/nogizhopaboroda/iponmap
:: # https://github.com/aksakalli/gtop

:: Linting and Style Check
:: ECHO  [44m Installing Linting and Style Check Modules: [0m & ECHO.

:: # https://github.com/eslint/eslint
:: CALL npm install --global eslint
:: # https://github.com/jshint/jshint
:: CALL npm install --global jshint
:: # https://github.com/prettier/prettier
:: CALL npm install --global prettier

:: Git Integrations and Utilities
ECHO. & ECHO  [44m Installing Git Integration and Utility Modules: [0m & ECHO.

:: # https://github.com/TejasQ/add-gitignore
CALL npm install --global add-gitignore
:: # https://github.com/so-fancy/diff-so-fancy
CALL npm install --global diff-so-fancy
:: # https://github.com/svhawks/g3l
CALL npm install --global g3l
:: # https://github.com/paulirish/git-open
CALL npm install --global git-open
:: # https://github.com/carloscuesta/gitmoji-cli
:: CALL npm install --global gitmoji-cli
:: # https://github.com/himynameisdave/git-labelmaker
:: :: CALL npm install --global git-labelmaker

:: NodeJS Utilities
ECHO. & ECHO  [44m Installing NodeJS Utility Modules: [0m & ECHO.

:: # https://github.com/alanshaw/david
CALL npm install --global david
:: # https://github.com/dylang/npm-check
CALL npm install --global npm-check
:: # https://github.com/tjunnone/npm-check-updates
CALL npm install --global npm-check-updates
:: # https://github.com/ruyadorno/ntl
:: # TODO: Check peer dependencies -> inquirer
CALL npm install --global ntl
:: # https://github.com/siddharthkp/cost-of-modules
CALL npm install --global cost-of-modules
:: # https://github.com/dependency-check-team/dependency-check
:: CALL npm install --global dependency-check
:: # https://github.com/workshopper/how-to-npm
:: CALL npm install --global how-to-npm
:: # https://github.com/GoogleChromeLabs/ndb
:: # NOTE: ndb requires windows-build-tools
:: CALL npm install --global ndb
:: # https://github.com/sindresorhus/np
:: CALL npm install --global np
:: # https://github.com/zeke/npe
:: CALL npm install --global npe
:: # https://github.com/voidcosmos/npkill
:: CALL npm install --global npkill
:: # https://github.com/zeke/package-json-to-readme
:: CALL npm install --global package-json-to-readme
:: # https://github.com/Unitech/pm2
:: CALL npm install --global pm2
:: # https://github.com/felixrieseberg/windows-build-tools
:: # NOTE: windows-build-tools install must be run in admin prompt
:: CALL npm install --global windows-build-tools

:: TypeScript and Utilities
:: ECHO. & ECHO  [44m Installing TypeScript and Utility Modules: [0m & ECHO.

:: # https://github.com/xavdid/typed-install
:: CALL npm install --global typed-install
:: # https://github.com/microsoft/TypeScript
:: CALL npm install --global typescript
:: # https://github.com/bitjson/typescript-starter
:: CALL npm install --global typescript-starter
:: # https://github.com/jeffijoe/typesync
:: CALL npm install --global typesync

:: Development Utilities
ECHO. & ECHO  [44m Installing Development Utility Modules: [0m & ECHO.

:: # man pages and cheat sheets
:: # https://github.com/tldr-pages/tldr
:: # https://github.com/tldr-pages/tldr-node-client
:: CALL npm install --global tldr
:: # Image minifier
:: # https://github.com/imagemin/imagemin-cli
:: CALL npm install --global imagemin-cli
:: # License generator
:: # https://github.com/plibither8/licensed
CALL npm install --global licensed
:: # Google's website performance test
:: # https://github.com/GoogleChrome/lighthouse/
:: CALL npm install --global lighthouse
:: # Progressive web metrics
:: # https://github.com/paulirish/pwmetrics
:: CALL npm install --global pwmetrics
:: # Placeholder image generator
:: # https://github.com/ecrmnn/spaceholder
:: CALL npm install --global spaceholder
:: # SVG Optimizer
:: # https://github.com/svg/svgo
:: CALL npm install --global svgo
:: # https://github.com/facebook/create-react-app
:: CALL npm install --global create-react-app
:: # https://github.com/encharm/Font-Awesome-SVG-PNG
:: # NOTE: font-awesome-svg-png requires rsvg-convert to be on $PATH
:: CALL npm install --global font-awesome-svg-png
:: # https://github.com/Javascipt/Jsome
:: CALL npm install --global jsome
:: # https://github.com/WeiChiaChang/stacks-cli
:: CALL npm install --global stacks-cli
:: # https://github.com/strapi/strapi
:: CALL npm install --global strapi@beta
:: # https://github.com/kevva/viewport-list-cli
:: CALL npm install --global viewport-list-cli

:: System Utilities
ECHO. & ECHO  [44m Installing System Utility Modules: [0m & ECHO.

REM # https://github.com/sindresorhus/empty-trash-cli
CALL npm install --global empty-trash-cli
REM # https://github.com/sindresorhus/trash-cli
CALL npm install --global trash-cli
REM # https://github.com/kevva/wifi-password-cli
CALL npm install --global wifi-password-cli
REM # https://github.com/rafaelrinaldi/whereami
REM :: CALL npm install --global @rafaelrinaldi/whereami
REM # https://github.com/sindresorhus/fkill-cli
REM :: CALL npm install --global fkill-cli
REM # https://github.com/sindresorhus/open-cli
CALL npm install --global open-cli
REM # https://github.com/sindresorhus/pageres-cli
REM :: CALL npm install --global pageres-cli

REM Yeoman and generators
REM :: ECHO. & ECHO  [44m Installing Yeoman and Generators: [0m & ECHO.

REM # https://github.com/yeoman/yo
REM :: CALL npm install --global yo

REM HTML/Frontend
REM # https://github.com/h5bp/generator-h5bp
REM :: CALL npm install --global generator-h5bp
REM # https://github.com/yeoman/generator-webapp
REM :: CALL npm install --global generator-webapp
REM JavaScript/Node
REM :: (Ava/Codecov)
REM # https://github.com/sindresorhus/generator-nm
REM :: CALL npm install --global generator-nm
REM :: (Jest/Coveralls)
REM # https://github.com/yeoman/generator-node
REM :: CALL npm install --global generator-node
REM Typescript
REM :: (Jest)
REM # https://github.com/ospatil/generator-node-typescript
REM :: CALL npm install --global generator-node-typescript
REM :: (Ava)
REM # https://github.com/phunguyen19/generator-typescript-starter
REM :: CALL npm install --global generator-typescript-starter

:: Alternative Package Managers
ECHO. & ECHO  [44m Installing Alternative Package Managers: [0m & ECHO.

:: # https://github.com/alexanderGugel/ied
:: CALL npm install --global ied
:: # https://github.com/pnpm/pnpm
CALL npm install --global pnpm
:: Upgrade pnpm
ECHO. & ECHO  [44m Upgrading PNPM: [0m & ECHO.
CALL pnpm install --global pnpm
:: # https://github.com/yarnpkg/yarn
CALL npm install --global yarn

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

:: Print NPM global installs
ECHO  [44m Listing NPM Global Installs: [0m & ECHO.
CALL npm list --global --depth=0

:: Check for outdated modules
:: ECHO. & ECHO  [44m Checking for Outdated Modules: [0m & ECHO.
:: CALL david -g

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
