#!/usr/bin/env node

/**
 *  bin/checkUpdates.js
 */

// *IMPORTS *

// import fs from 'fs'
const fs = require('fs')
const os = require('os')
const childProcess = require('child_process')

// eslint-disable-next-line import/no-extraneous-dependencies
const chalk = require('chalk')

// * CONSTANTS *

const { log } = console;

// Text Styles
const info = chalk.bgGreen.black;
const err = chalk.bgRed.black;

// * FUNCTIONS *

/**
 * Check for outdated node modules
 */

log(info("\n Checking for Outdated Node Modules \n"));

// Commands to run
const commands = [
  { command: "npx -q npm-check-updates --packageFile package.json & echo." },
  // { command: "npx -q updates & echo." }
];

if (fs.existsSync('yarn.lock')) {
  commands.unshift(
    { command: "yarn outdated & echo." },
  )
} else {
  commands.unshift(
    { command: "npm outdated & echo." },
  )
}

commands
  .filter(({ onlyPlatforms }) => !onlyPlatforms || onlyPlatforms.includes(os.platform()))
  .forEach(commandAndOptions => {
    const { command, onlyPlatform: _, ...options } = commandAndOptions
    try {
      childProcess.execSync(command, {
        stdio: "inherit",
        ...options,
      })
    } catch (error) {
      log(err(" ERROR ") + error)
      // process.exit(error.status)
    }
  })

log(info(" DONE \n"))

/* EOF */
