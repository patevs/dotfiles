#!/usr/bin/env node

/**
 *  scripts/postInstall.js
 */

const childProcess = require("child_process")
const os = require("os")

const chalk = require('chalk');
const log = console.log;

// Text Styles
const info = chalk.bgGreen.black;
const err = chalk.bgRed.black;

log(info("\n Running Post-Install Script \n"))

/**
 * Do all things that need to be done after installing packages
 *
 * Yes, it slows down package installation a little, but it's nice to not
 * have to remember these extra steps.
 */
;[
  // Initialize git submodules
  { command: "git submodule update --init" },
]
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
      process.exit(error.status)
    }
  })

log(info("\n DONE \n"))

/* EOF */

