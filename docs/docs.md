# Dotfiles Documentation

> This document contains infomation and resources relating to system configuration, dotfiles, and their management.

---

## Links and Resources

* [Dotfiles on GitHub](https://github.com/search?q=dotfiles)
* [`awesome-dotfiles`](https://github.com/webpro/awesome-dotfiles)

---

### Example Dotfiles

* [`jayharris/dotfiles-windows`](https://github.com/jayharris/dotfiles-windows)
* [`mikemaccana/powershell-profile`](https://github.com/mikemaccana/powershell-profile)
* [`felixriesebery/windows-development-environment`](https://github.com/felixrieseberg/windows-development-environment)

[](.)

* [`holman/dotfiles`](https://github.com/holman/dotfiles)
* [`mathiadbynens/dotfiles`](https://github.com/mathiasbynens/dotfiles)
* [`paulirish/dotfiles`](https://github.com/paulirish/dotfiles)
* [`sanctum.geek.nz/dotfiles`](https://sanctum.geek.nz/cgit/dotfiles.git/about/)
* [`nicknisi/dotfiles`](https://github.com/nicknisi/dotfiles)

---

## Bash

* [`.bashrc` vs. `.profile`](https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc)

---

**TL;DR:**

  `~/.bash_profile` should be super-simple and just load `.profile` and `.bashrc` (in that order)

  `~/.profile` has the stuff NOT specifically related to bash, such as environment variables (PATH and friends)

  `~/.bashrc` has anything you'd want at an interactive command line. Command prompt, EDITOR variable, bash aliases for my use

A few other notes:

  Anything that should be available to graphical applications OR to sh (or bash invoked as sh) MUST be in `~/.profile`

  `~/.bashrc` must not output anything

  Anything that should be available only to login shells should go in `~/.profile`

  Ensure that `~/.bash_login` does not exist.

---

## Windows Terminal

* [Profiles.json Documentation](https://github.com/microsoft/terminal/blob/master/doc/cascadia/SettingsSchema.md)

[](.)

* [PowerShell Wakatime](https://github.com/wakatime/wakatime/issues/126)
* [`powerwaka`](https://github.com/iamkarlson/powerwaka)

---
