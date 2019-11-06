# BASH

[`.bashrc` vs. `.profile`](https://superuser.com/questions/789448/choosing-between-bashrc-profile-bash-profile-etc)

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
