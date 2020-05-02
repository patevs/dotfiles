@ECHO OFF

:: ----------------------- ::
:: scripts/npm/install.cmd ::
:: ----------------------- ::

:: Batch script which installs various useful NPM global modules.
:: Requires NodeJS and NPM to be installed.

:: Tested Node Versions:
::  * 13.11.0
::  * 12.16.1
::  * 10.19.0
::  * 8.17.0

:: TODO:
::  * Create a .ps1 version of this script.
::  * Created .md document containing links and descriptions for each of these packages.
::  * Check for and skip already installed packages.

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


CALL npm install --global @commitlint/cli
CALL npm install --global commitlint-config-gitmoji
:: # https://github.com/TejasQ/add-gitignore
CALL npm install --global add-gitignore
:: # https://github.com/IonicaBizau/cli-github
:: CALL npm install --global cli-github
:: CALL npm install --global commitizen
:: CALL npm install --global cz-conventional-changelog
:: CALL npm install --global cz-emoji
:: # https://github.com/so-fancy/diff-so-fancy
:: Note: requires perl to be installed
CALL npm install --global diff-so-fancy
:: # https://github.com/svhawks/g3l
CALL npm install --global g3l
:: # https://github.com/mbostock/gistup
:: CALL npm install --global gistup
:: CALL npm install --global git-file-history
:: # https://github.com/paulirish/git-open
:: NOTE: Use `hub browse` command instead
:: CALL npm install --global git-open
:: # https://github.com/IonicaBizau/git-stats
:: CALL npm install --global git-stats
:: # https://github.com/carloscuesta/gitmoji-cli
CALL npm install --global gitmoji-cli
:: # https://github.com/himynameisdave/git-labelmaker
:: CALL npm install --global git-labelmaker
CALL npm install --global husky
:: # https://github.com/yyx990803/starz
:: CALL npm install --global starz
:: # https://github.com/FredrikNoren/ungit
:: CALL npm install --global ungit

:: ---------------------------------------------------------------------------- ::

:: NodeJS and NPM Utilities
ECHO. & ECHO  [44m Installing NodeJS and NPM Utility Modules: [0m & ECHO.


:: # https://github.com/siddharthkp/cost-of-modules
:: CALL npm install --global cost-of-modules
:: # https://github.com/alanshaw/david
CALL npm install --global david
:: CALL npm install --global depcheck
:: # https://github.com/dependency-check-team/dependency-check
:: CALL npm install --global dependency-check
:: CALL npm install --global emma-cli
:: CALL npm install --global install-peerdeps
:: # https://github.com/rouanw/npm-audit-helper
:: CALL npm install --global npm-audit-helper
:: # https://github.com/dylang/npm-check
CALL npm install --global npm-check
:: # https://github.com/tjunnone/npm-check-updates
CALL npm install --global npm-check-updates
:: # https://github.com/pksunkara/npm-police
:: CALL npm install --global police
:: # https://github.com/lirantal/npq
:: CALL npm install --global npq
:: # https://github.com/sculove/nti
:: CALL npm install --global nti
:: # https://github.com/ruyadorno/ntl
CALL npm install --global ntl
:: # https://github.com/workshopper/how-to-npm
:: CALL npm install --global how-to-npm
:: # https://github.com/franciscop/legally
:: CALL npm install --global legally
:: # https://github.com/davglass/license-checker
:: CALL npm install --global license-checker
:: # https://github.com/lirantal/lockfile-lint
:: CALL npm install --global lockfile-lint
:: # https://github.com/GoogleChromeLabs/ndb
:: # NOTE: ndb requires windows-build-tools
:: CALL npm install --global ndb
:: # https://github.com/sindresorhus/np
:: CALL npm install --global np
:: # https://github.com/zeke/npe
:: CALL npm install --global npe
:: # https://github.com/voidcosmos/npkill
:: CALL npm install --global npkill
:: CALL npm install --global npm-cache
:: CALL npm install --global npm-gui
:: CALL npm install --global npm-install-peers
:: # https://github.com/tclindner/npm-package-json-lint
:: CALL npm install --global npm-package-json-lint
:: # https://github.com/felixrieseberg/npm-windows-upgrade
CALL npm install --global --production npm-windows-upgrade
:: CALL npm install --global npminstall
:: # https://github.com/npms-io/npms-cli
:: CALL npm install --global npms-cli
:: # https://github.com/gorillamania/package.json-validator
:: CALL npm install --global package-json-validator
:: # https://github.com/zeke/package-json-to-readme
:: CALL npm install --global package-json-to-readme
:: # https://github.com/Unitech/pm2
:: CALL npm install --global pm2
:: CALL npm install --global shrinkpack
:: # https://github.com/silverwind/updates
:: CALL npm install --global updates
:: CALL npm install --global updtr
:: # https://github.com/felixrieseberg/windows-build-tools
:: # NOTE: windows-build-tools install must be run in admin prompt
:: CALL npm install --global windows-build-tools
:: # https://github.com/bntzio/wipe-modules
:: CALL npm install --global wipe-modules
:: # https://github.com/Muldoser/ytl
:: CALL npm install --global ytl

:: ---------------------------------------------------------------------------- ::

:: TypeScript and Utilities
ECHO. & ECHO  [44m Installing TypeScript and Utility Modules: [0m & ECHO.

:: # https://github.com/xavdid/typed-install
:: CALL npm install --global typed-install
:: # https://github.com/microsoft/TypeScript
CALL npm install --global typescript
:: # https://github.com/bitjson/typescript-starter
:: CALL npm install --global typescript-starter
:: # https://github.com/jeffijoe/typesync
CALL npm install --global typesync

:: ---------------------------------------------------------------------------- ::

:: Development Utilities
ECHO. & ECHO  [44m Installing Development Utility Modules: [0m & ECHO.

:: # https://github.com/bower/bower
:: CALL npm install --global bower
:: # https://github.com/kentcdodds/clog-cli
:: CALL npm install --global clog-cli
:: # https://github.com/Keyang/node-csvtojson
:: CALL npm install --global csvtojson
:: # https://github.com/benawad/destiny
:: CALL npm install --global destiny
:: # https://github.com/alchaplinsky/devion
:: CALL npm install --global devion
:: # https://github.com/thlorenz/doctoc
:: CALL npm install --global doctoc
:: # https://github.com/encharm/Font-Awesome-SVG-PNG
:: # NOTE: font-awesome-svg-png requires rsvg-convert to be on $PATH
:: CALL npm install --global font-awesome-svg-png
:: # https://github.com/zaaack/foy
:: CALL npm install --global foy
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
:: # https://github.com/alexfernandez/loadtest
:: CALL npm install --global loadtest
:: # https://github.com/localtunnel/localtunnel
:: CALL npm install --global localtunnel
:: CALL npm install --global maid
:: # https://github.com/cezaraugusto/mklicense
:: Note: try licensed instead
:: CALL npm install --global mklicense
:: CALL npm install --global nativefier
::: # https://github.com/neovim/node-client
CALL npm install --global neovim
:: # https://github.com/jhotmann/node-passgen-cli
:: CALL npm install --global passgen-cli
:: # https://github.com/sdras/project-explorer
:: Note: requires yarn to be installed
:: CALL npm install --global project-explorer
:: # https://github.com/release-it/release-it
:: CALL npm install --global release-it
:: # https://github.com/jhotmann/node-rename-cli
:: CALL npm install --global rename-cli
:: # https://github.com/semantic-release/semantic-release
:: CALL npm install --global semantic-release
:: # Placeholder image generator
:: # https://github.com/ecrmnn/spaceholder
:: CALL npm install --global spaceholder
:: CALL npm install --global speedracer
:: # SVG Optimizer
:: # https://github.com/svg/svgo
:: CALL npm install --global svgo
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

:: Mobile Development Utilities
ECHO. & ECHO  [44m Installing Mobile Development Utility Modules: [0m & ECHO.

CALL npm install --global emus
:: # https://github.com/SamVerschueren/mobicon-cli
:: NOTE: Requires GraphicsMagick to be installed
:: CALL npm install --global mobicon-cli
:: # https://github.com/SamVerschueren/mobisplash-cli
:: CALL npm install --global mobisplash-cli
:: # https://github.com/wswebcreation/start-android-emulator
:: CALL npm install --global start-android-emulator

:: ---------------------------------------------------------------------------- ::

:: React Development Utilities
:: ECHO. & ECHO  [44m Installing React Development Utility Modules: [0m & ECHO.

:: # https://github.com/facebook/create-react-app
:: CALL npm install --global create-react-app
:: # https://github.com/diegohaz/generact
:: CALL npm install --global generact

:: ---------------------------------------------------------------------------- ::

:: React Native Development Utilities
ECHO. & ECHO  [44m Installing React Native Development Utility Modules: [0m & ECHO.

:: # https://github.com/microsoft/reactxp
:: CALL npm install --global create-rx-app
:: # https://github.com/infinitered/ignite
CALL npm install --global ignite-cli
:: # https://github.com/react-native-community/cli
CALL npm install --global react-native-cli
:: # https://github.com/junedomingo/react-native-rename
:: CALL npm install --global react-native-rename
:: # https://github.com/rnpm/rnpm
:: CALL npm install --global rnpm
:: # https://github.com/react-native-contrib/rsx
:: CALL npm install --global rsx

:: ---------------------------------------------------------------------------- ::

:: Security Utilities
:: ECHO. & ECHO  [44m Installing Security Utility Modules: [0m & ECHO.

:: # Google's website performance test
:: # https://github.com/GoogleChrome/lighthouse/
:: CALL npm install --global lighthouse
:: # https://github.com/voorhoede/lighthouse-security
:: CALL npm install --global lighthouse-security
:: # Progressive web metrics
:: # https://github.com/paulirish/pwmetrics
:: CALL npm install --global pwmetrics
:: # https://github.com/lirantal/is-website-vulnerable
:: CALL npm install --global is-website-vulnerable


:: ---------------------------------------------------------------------------- ::

:: System Utilities
ECHO. & ECHO  [44m Installing System Utility Modules: [0m & ECHO.

:: # https://github.com/sindresorhus/del-cli
CALL npm install --global del-cli
:: # https://github.com/sindresorhus/empty-trash-cli
:: CALL npm install --global empty-trash-cli
:: # https://github.com/sindresorhus/fkill-cli
:: CALL npm install --global fkill-cli
:: # https://github.com/lordgiotto/google-font-installer
:: CALL npm install --global google-font-installer
:: # https://github.com/aksakalli/gtop
CALL npm install --global gtop
:: CALL npm install --global incognitoz
:: # https://github.com/sindresorhus/open-cli
:: CALL npm install --global open-cli
:: # https://github.com/sindresorhus/pageres-cli
:: CALL npm install --global pageres-cli
:: # https://github.com/gillstrom/screensaver
:: CALL npm install --global screensaver
:: # https://github.com/marionebl/share-cli
:: CALL npm install --global share-cli
:: # https://github.com/sindresorhus/trash-cli
:: CALL npm install --global trash-cli
:: # https://github.com/MrRio/vtop
:: # NOTE: vtop must be run using sh/bash. try gtop instead
:: CALL npm install --global vtop
:: # https://github.com/kevva/wifi-password-cli
CALL npm install --global wifi-password-cli

:: ---------------------------------------------------------------------------- ::

:: Yeoman and generators
:: ECHO. & ECHO  [44m Installing Yeoman and Generators: [0m & ECHO.

:: # https://github.com/yeoman/yo
:: CALL npm install --global yo

:: ASP.NET Core
:: requires bower to be installed
:: # https://github.com/OmniSharp/generator-aspnet
:: CALL npm install --global generator-aspnet

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

:: React Native
:: # https://github.com/bamlab/generator-rn-toolbox
:: CALL npm install --global generator-rn-toolbox

:: ---------------------------------------------------------------------------- ::

:: Alternative Package Managers
ECHO. & ECHO  [44m Installing Alternative Package Managers: [0m & ECHO.

:: # https://github.com/alexanderGugel/ied
:: CALL npm install --global ied
:: # https://github.com/pnpm/pnpm
:: CALL npm install --global pnpm
:: Upgrade pnpm
:: ECHO. & ECHO  [44m Upgrading PNPM: [0m & ECHO.
:: CALL pnpm install --global pnpm
:: # https://github.com/yarnpkg/yarn
CALL npm install --global yarn

:: ---------------------------------------------------------------------------- ::

:: Miscellaneous Modules
:: ECHO. & ECHO  [44m Installing Miscellaneous Modules: [0m & ECHO.

:: # https://github.com/rafaelrinaldi/whereami
:: CALL npm install --global @rafaelrinaldi/whereami
:: # https://github.com/ahmadawais/corona-cli
CALL npm install --global corona-cli
:: # https://github.com/nogizhopaboroda/iponmap
:: CALL npm install --global iponmap
:: # https://github.com/denysdovhan/learnyoubash
:: CALL npm install --global learnyoubash
:: # https://github.com/mayankchd/movie
:: CALL npm install --global movie-cli
:: # https://github.com/xxczaki/nasa-cli
:: CALL npm install --global nasa-cli
:: CALL npm install --global tiny-care-terminal
:: # https://github.com/riyadhalnur/weather-cli
:: CALL npm install --global weather-cli
:: # https://github.com/webtorrent/webtorrent-cli
:: CALL npm install --global webtorrent-cli

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

