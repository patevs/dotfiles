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

REM Just for fun, testing, or to be sorted
REM :: ECHO  [44m Installing Just-For-Fun and Testing Modules: [0m & ECHO.

REM # https://github.com/xxczaki/nasa-cli
REM CALL npm install --global nasa-cli
REM # https://github.com/mishoo/UglifyJS2
REM CALL npm install --global uglify-js
REM # https://github.com/sitespeedio/sitespeed.io
REM # https://github.com/lirantal/is-website-vulnerable
REM # https://github.com/webtorrent/webtorrent-cli
REM :: vtop must be run using sh/bash
REM # https://github.com/MrRio/vtop
REM # https://github.com/kangax/html-minifier
REM # https://github.com/ddopson/underscore-cli
REM # https://github.com/lordgiotto/google-font-installer
REM # https://github.com/riyadhalnur/weather-cli
REM # https://github.com/jhotmann/node-passgen-cli
REM # https://github.com/thlorenz/doctoc
REM # https://github.com/GitbookIO/gitbook
REM # https://github.com/marionebl/share-cli
REM # https://github.com/jhotmann/node-rename-cli
REM # https://github.com/IonicaBizau/cli-github
REM # https://github.com/mbostock/gistup
REM # https://github.com/voorhoede/lighthouse-security
REM # https://github.com/gillstrom/screensaver
REM # https://github.com/cezaraugusto/mklicense
:: https://github.com/IonicaBizau/git-stats
:: https://github.com/nogizhopaboroda/iponmap
:: https://github.com/aksakalli/gtop

REM Linting and Style Check
REM :: ECHO  [44m Installing Linting and Style Check Modules: [0m & ECHO.

REM # https://github.com/eslint/eslint
REM :: CALL npm install --global eslint
REM # https://github.com/jshint/jshint
REM :: CALL npm install --global jshint
REM # https://github.com/prettier/prettier
REM :: CALL npm install --global prettier

REM Git Integrations and Utilities
ECHO. & ECHO  [44m Installing Git Integration and Utility Modules: [0m & ECHO.

REM # https://github.com/TejasQ/add-gitignore
CALL npm install --global add-gitignore
REM # https://github.com/so-fancy/diff-so-fancy
CALL npm install --global diff-so-fancy
REM # https://github.com/svhawks/g3l
CALL npm install --global g3l
REM # https://github.com/paulirish/git-open
CALL npm install --global git-open
REM # https://github.com/carloscuesta/gitmoji-cli
REM :: CALL npm install --global gitmoji-cli
REM # https://github.com/himynameisdave/git-labelmaker
REM :: CALL npm install --global git-labelmaker

REM NodeJS Utilities
ECHO. & ECHO  [44m Installing NodeJS Utility Modules: [0m & ECHO.

REM # https://github.com/alanshaw/david
CALL npm install --global david
REM # https://github.com/dylang/npm-check
CALL npm install --global npm-check
REM # https://github.com/tjunnone/npm-check-updates
CALL npm install --global npm-check-updates
REM # https://github.com/ruyadorno/ntl
CALL npm install --global ntl
REM # https://github.com/siddharthkp/cost-of-modules
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

REM Development Utilities
REM :: ECHO. & ECHO  [44m Installing Development Utility Modules: [0m & ECHO.

REM # man pages and cheat sheets
REM # https://github.com/tldr-pages/tldr
REM # https://github.com/tldr-pages/tldr-node-client
REM :: CALL npm install --global tldr
REM # Image minifier
REM # https://github.com/imagemin/imagemin-cli
REM :: CALL npm install --global imagemin-cli
REM # License generator
REM # https://github.com/plibither8/licensed
REM :: CALL npm install --global licensed
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

REM Alternative Package Managers
REM :: ECHO. & ECHO  [44m Installing Alternative Package Managers: [0m & ECHO.

REM ## https://github.com/alexanderGugel/ied
REM :: CALL npm install --global ied
REM # https://github.com/pnpm/pnpm
REM :: CALL npm install --global pnpm
REM Upgrade pnpm
REM :: ECHO. & ECHO  [44m Upgrading PNPM: [0m & ECHO.
REM :: CALL pnpm install --global pnpm
REM # https://github.com/yarnpkg/yarn
REM :: CALL npm install --global yarn

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

REM Print NPM global installs

ECHO  [44m Listing NPM Global Installs: [0m & ECHO.

CALL npm list --global --depth=0

REM Check for outdated modules

REM :: ECHO. & ECHO  [44m Checking for Outdated Modules: [0m & ECHO.

REM :: CALL david -g

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
