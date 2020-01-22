@ECHO OFF

:: ----------------------- ::
:: scripts/npm/install.cmd ::
:: ----------------------- ::

:: Batch script which installs various useful NPM global modules.
:: Requires NodeJS and NPM to be installed.

:: TODO: Check for already installed packages

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
ECHO. & ECHO [92m All Requirements Satisfied! Installing NPM Global Modules... [0m
:: & ECHO.

:: ---------------------------------------------------------------------------- ::

:: Linting and Style Check
:: ECHO  [44m Installing Linting and Style Check Modules: [0m & ECHO.

:: # https://github.com/eslint/eslint
:: CALL npm install --global eslint
:: # https://github.com/jshint/jshint
:: CALL npm install --global jshint
:: # https://github.com/prettier/prettier
:: CALL npm install --global prettier

:: ---------------------------------------------------------------------------- ::

:: Git Integrations and Utilities
ECHO. & ECHO  [44m Installing Git Integration and Utility Modules: [0m & ECHO.


:: Not an NPM module:
:: # https://github.com/qw3rtman/git-fire


:: # https://github.com/TejasQ/add-gitignore
CALL npm install --global add-gitignore
:: # https://github.com/IonicaBizau/cli-github
:: CALL npm install --global cli-github
:: # https://github.com/so-fancy/diff-so-fancy
:: Note: requires perl to be installed
CALL npm install --global diff-so-fancy
:: # https://github.com/svhawks/g3l
CALL npm install --global g3l
:: # https://github.com/mbostock/gistup
:: CALL npm install --global gistup
:: # https://github.com/paulirish/git-open
:: NOTE: Use `hub browse` command instead
:: CALL npm install --global git-open
:: # https://github.com/IonicaBizau/git-stats
:: CALL npm install --global git-stats
:: # https://github.com/carloscuesta/gitmoji-cli
:: CALL npm install --global gitmoji-cli
:: # https://github.com/himynameisdave/git-labelmaker
:: :: CALL npm install --global git-labelmaker

:: ---------------------------------------------------------------------------- ::

:: NodeJS and NPM Utilities
ECHO. & ECHO  [44m Installing NodeJS and NPM Utility Modules: [0m & ECHO.


:: # https://github.com/alanshaw/david
CALL npm install --global david
:: # https://github.com/dylang/npm-check
:: CALL npm install --global npm-check
:: # https://github.com/tjunnone/npm-check-updates
:: CALL npm install --global npm-check-updates
:: # https://github.com/sculove/nti
:: CALL npm install --global nti
:: # https://github.com/ruyadorno/ntl
CALL npm install --global ntl
:: # https://github.com/siddharthkp/cost-of-modules
:: CALL npm install --global cost-of-modules
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
:: https://github.com/npms-io/npms-cli
:: CALL npm install --global npms-cli
:: CALL npm install --global npkill
:: # https://github.com/zeke/package-json-to-readme
:: CALL npm install --global package-json-to-readme
:: # https://github.com/Unitech/pm2
:: CALL npm install --global pm2
:: # https://github.com/felixrieseberg/windows-build-tools
:: # NOTE: windows-build-tools install must be run in admin prompt
:: CALL npm install --global windows-build-tools
:: # https://github.com/Muldoser/ytl
:: CALL npm install --global ytl

:: ---------------------------------------------------------------------------- ::

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

:: ---------------------------------------------------------------------------- ::

:: Development Utilities
:: ECHO. & ECHO  [44m Installing Development Utility Modules: [0m & ECHO.

:: # https://github.com/kentcdodds/clog-cli
:: CALL npm install --global clog-cli
:: # https://github.com/facebook/create-react-app
:: CALL npm install --global create-react-app
:: # https://github.com/thlorenz/doctoc
:: CALL npm install --global doctoc
:: # https://github.com/encharm/Font-Awesome-SVG-PNG
:: # NOTE: font-awesome-svg-png requires rsvg-convert to be on $PATH
:: CALL npm install --global font-awesome-svg-png
:: # https://github.com/gatsbyjs/gatsby
:: CALL npm install --global gatsby-cli
:: # https://github.com/GitbookIO/gitbook
:: CALL npm install --global gitbook-cli
:: # https://github.com/cutenode/good-first-issue
:: CALL npm install --global good-first-issue
:: # https://github.com/kangax/html-minifier
:: CALL npm install --global html-minifer
:: # Image minifier
:: # https://github.com/imagemin/imagemin-cli
:: CALL npm install --global imagemin-cli
:: # https://github.com/Javascipt/Jsome
:: CALL npm install --global jsome
:: # License generator
:: # https://github.com/plibither8/licensed
CALL npm install --global licensed
:: # Google's website performance test
:: # https://github.com/GoogleChrome/lighthouse/
:: CALL npm install --global lighthouse
:: # https://github.com/voorhoede/lighthouse-security
:: CALL npm install --global lighthouse-security
:: # https://github.com/cezaraugusto/mklicense
:: Note: try licensed instead
:: CALL npm install --global mklicense
::: # https://github.com/neovim/node-client
:: CALL npm install --global neovim
:: # https://github.com/jhotmann/node-passgen-cli
:: CALL npm install --global passgen-cli
:: https://github.com/sdras/project-explorer
:: Note: requires yarn to be installed
:: CALL npm install --global project-explorer
:: # Progressive web metrics
:: # https://github.com/paulirish/pwmetrics
:: CALL npm install --global pwmetrics
:: # https://github.com/release-it/release-it
:: CALL npm install --global release-it
:: # https://github.com/jhotmann/node-rename-cli
:: CALL npm install --global rename-cli
:: # https://github.com/semantic-release/semantic-release
:: CALL npm install --global semantic-release
:: # Placeholder image generator
:: # https://github.com/ecrmnn/spaceholder
:: CALL npm install --global spaceholder
:: # SVG Optimizer
:: # https://github.com/svg/svgo
:: CALL npm install --global svgo
:: # https://github.com/lirantal/is-website-vulnerable
:: CALL npm install --global is-website-vulnerable
:: # https://github.com/sitespeedio/sitespeed.io
:: CALL npm install --global sitespeed.io
:: # https://github.com/WeiChiaChang/stacks-cli
:: CALL npm install --global stacks-cli
:: # https://github.com/strapi/strapi
:: CALL npm install --global strapi@beta
:: # https://github.com/tldr-pages/tldr
:: # https://github.com/tldr-pages/tldr-node-client
:: CALL npm install --global tldr
:: # https://github.com/mishoo/UglifyJS2
:: CALL npm install --global uglify-js
:: # https://github.com/ddopson/underscore-cli
:: CALL npm install --global underscore-cli
:: # https://github.com/kevva/viewport-list-cli
:: CALL npm install --global viewport-list-cli
:: # https://github.com/yui/yuglify
:: CALL npm install --global yuglify

:: ---------------------------------------------------------------------------- ::

:: System Utilities
ECHO. & ECHO  [44m Installing System Utility Modules: [0m & ECHO.

:: # https://github.com/rafaelrinaldi/whereami
:: CALL npm install --global @rafaelrinaldi/whereami
:: # https://github.com/sindresorhus/empty-trash-cli
CALL npm install --global empty-trash-cli
:: # https://github.com/sindresorhus/fkill-cli
:: CALL npm install --global fkill-cli
:: # https://github.com/lordgiotto/google-font-installer
:: CALL npm install --global google-font-installer
:: # https://github.com/aksakalli/gtop
:: CALL npm install --global gtop
:: # https://github.com/nogizhopaboroda/iponmap
:: CALL npm install --global iponmap
:: # https://github.com/sindresorhus/open-cli
:: CALL npm install --global open-cli
:: # https://github.com/sindresorhus/pageres-cli
:: CALL npm install --global pageres-cli
:: # https://github.com/gillstrom/screensaver
:: CALL npm install --global screensaver
:: # https://github.com/marionebl/share-cli
:: CALL npm install --global share-cli
:: # https://github.com/sindresorhus/trash-cli
CALL npm install --global trash-cli
:: # https://github.com/MrRio/vtop
:: # NOTE: vtop must be run using sh/bash. try gtop instead
:: CALL npm install --global vtop
:: # https://github.com/riyadhalnur/weather-cli
:: CALL npm install --global weather-cli
:: # https://github.com/webtorrent/webtorrent-cli
:: CALL npm install --global webtorrent-cli
:: # https://github.com/kevva/wifi-password-cli
CALL npm install --global wifi-password-cli

:: ---------------------------------------------------------------------------- ::

:: Yeoman and generators
:: ECHO. & ECHO  [44m Installing Yeoman and Generators: [0m & ECHO.

:: # https://github.com/yeoman/yo
:: CALL npm install --global yo

:: HTML/Frontend
:: # https://github.com/h5bp/generator-h5bp
:: CALL npm install --global generator-h5bp
:: # https://github.com/yeoman/generator-webapp
:: CALL npm install --global generator-webapp
:: JavaScript/Node
:: (Ava/Codecov)
:: # https://github.com/sindresorhus/generator-nm
:: CALL npm install --global generator-nm
:: (Jest/Coveralls)
:: # https://github.com/yeoman/generator-node
:: CALL npm install --global generator-node
:: Typescript
:: (Jest)
:: # https://github.com/ospatil/generator-node-typescript
:: CALL npm install --global generator-node-typescript
:: (Ava)
:: # https://github.com/phunguyen19/generator-typescript-starter
:: CALL npm install --global generator-typescript-starter

:: ---------------------------------------------------------------------------- ::

:: Alternative Package Managers
:: ECHO. & ECHO  [44m Installing Alternative Package Managers: [0m & ECHO.

:: # https://github.com/alexanderGugel/ied
:: CALL npm install --global ied
:: # https://github.com/pnpm/pnpm
:: CALL npm install --global pnpm
:: Upgrade pnpm
:: ECHO. & ECHO  [44m Upgrading PNPM: [0m & ECHO.
:: CALL pnpm install --global pnpm
:: # https://github.com/yarnpkg/yarn
:: CALL npm install --global yarn

:: ---------------------------------------------------------------------------- ::

:: Miscellaneous Modules
:: ECHO. & ECHO  [44m Installing Miscellaneous Modules: [0m & ECHO.

:: # https://github.com/xxczaki/nasa-cli
:: CALL npm install --global nasa-cli

:: ---------------------------------------------------------------------------- ::

ECHO. & ECHO [92m Finished Installing NPM Global Modules! [0m & ECHO.

:: Print NPM global installs
ECHO  [44m Listing NPM Global Installs: [0m & ECHO.
CALL npm list --global --depth=0

:: Check for outdated modules
:: ECHO. & ECHO  [44m Checking for Outdated Modules: [0m & ECHO.
:: CALL david -g

ECHO. & ECHO  [42m Done! [0m

GOTO :EOF
