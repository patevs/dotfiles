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
:: vtop must be run using sh/bash
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
:: https://github.com/IonicaBizau/git-stats
:: https://github.com/nogizhopaboroda/iponmap
:: https://github.com/aksakalli/gtop

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
:: TODO: Check peer dependencies -> inquirer
CALL npm install --global ntl
:: # https://github.com/siddharthkp/cost-of-modules
CALL npm install --global cost-of-modules
REM # https://github.com/dependency-check-team/dependency-check
REM :: CALL npm install --global dependency-check
REM # https://github.com/workshopper/how-to-npm
REM :: CALL npm install --global how-to-npm
REM # https://github.com/GoogleChromeLabs/ndb
REM :: NOTE: ndb requires windows-build-tools
REM :: CALL npm install --global ndb
REM # https://github.com/sindresorhus/np
REM :: CALL npm install --global np
REM # https://github.com/zeke/npe
REM :: CALL npm install --global npe
REM # https://github.com/voidcosmos/npkill
REM :: CALL npm install --global npkill
REM # https://github.com/zeke/package-json-to-readme
REM :: CALL npm install --global package-json-to-readme
REM # https://github.com/Unitech/pm2
REM :: CALL npm install --global pm2
REM # https://github.com/felixrieseberg/windows-build-tools
REM :: NOTE: windows-build-tools install must be run in admin prompt
REM :: CALL npm install --global windows-build-tools

REM TypeScript and Utilities
REM :: ECHO. & ECHO  [44m Installing TypeScript and Utility Modules: [0m & ECHO.

REM # https://github.com/xavdid/typed-install
REM :: CALL npm install --global typed-install
REM # https://github.com/microsoft/TypeScript
REM :: CALL npm install --global typescript
REM # https://github.com/bitjson/typescript-starter
REM :: CALL npm install --global typescript-starter
REM # https://github.com/jeffijoe/typesync
REM :: CALL npm install --global typesync

:: Development Utilities
ECHO. & ECHO  [44m Installing Development Utility Modules: [0m & ECHO.

REM # man pages and cheat sheets
REM # https://github.com/tldr-pages/tldr
REM # https://github.com/tldr-pages/tldr-node-client
REM :: CALL npm install --global tldr
REM # Image minifier
REM # https://github.com/imagemin/imagemin-cli
REM :: CALL npm install --global imagemin-cli
:: # License generator
:: # https://github.com/plibither8/licensed
CALL npm install --global licensed
REM # Google's website performance test
REM # https://github.com/GoogleChrome/lighthouse/
:: CALL npm install --global lighthouse
REM # Progressive web metrics
REM # https://github.com/paulirish/pwmetrics
:: CALL npm install --global pwmetrics
REM # Placeholder image generator
REM # https://github.com/ecrmnn/spaceholder
REM :: CALL npm install --global spaceholder
REM # SVG Optimizer
REM # https://github.com/svg/svgo
REM :: CALL npm install --global svgo
REM # https://github.com/facebook/create-react-app
REM :: CALL npm install --global create-react-app
REM # https://github.com/encharm/Font-Awesome-SVG-PNG
REM :: NOTE: font-awesome-svg-png requires rsvg-convert to be on $PATH
REM :: CALL npm install --global font-awesome-svg-png
REM # https://github.com/Javascipt/Jsome
REM :: CALL npm install --global jsome
REM # https://github.com/WeiChiaChang/stacks-cli
REM :: CALL npm install --global stacks-cli
REM # https://github.com/strapi/strapi
REM :: CALL npm install --global strapi@beta
REM # https://github.com/kevva/viewport-list-cli
REM :: CALL npm install --global viewport-list-cli

REM System Utilities
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
