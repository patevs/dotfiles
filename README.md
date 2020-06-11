# dotfiles

> Personal system configuration files commonly known as .files (dotfiles).

---

## Documentation

- [`docs`](./docs/docs.md)
- [`theme`](./docs/theme.md)
- [`tools`](./docs/theme.md)

---

## Installation and Usage Instructions

### Using Git and the bootstrap scripts

Clone the repository:

```powershell
git clone https://github.com/patevs/dotfiles.git
cd dotfiles
```

Install `PowerShell` profile:

```powershell
cd pwsh
.\bootstrap.ps1
```

Install global `Git` configuration:

```powershell
cd git
.\bootstrap.ps1
```

Install `Neovim` profile:

```powershell
cd nvim
.\bootstrap.ps1
```

Initialize `Git` submodules:

```powershell
git submodule update --init --recursive
```

### Git-free install

> **Note:** You must have your execution policy set to unrestricted (or at least in bypass) for this to work. To set this, run `Set-ExecutionPolicy Unrestricted` from a PowerShell running as Administrator.

To install these dotfiles from PowerShell without Git:

```bash
iex ((new-object net.webclient).DownloadString('https://raw.github.com/patevs/dotfiles/master/setup/install.ps1'))
```

To update later on, just run that command again.

---

## Sensible Windows Defaults

When setting up a new Windows PC, you may want to set some Windows defaults and features, such as showing hidden files in Windows Explorer and installing IIS. This will also set your machine name and full user name, so you may want to modify this file before executing.

```post
.\windows.ps1
```

---

## Install Dependencies and Packages

When setting up a new Windows box, you may want to install some common packages, utilities, and dependencies. These could include node.js packages via [NPM](https://www.npmjs.org), [Chocolatey](http://chocolatey.org/) packages, Windows Features and Tools via [Web Platform Installer](https://www.microsoft.com/web/downloads/platform.aspx), and Visual Studio Extensions from the [Visual Studio Gallery](http://visualstudiogallery.msdn.microsoft.com/).

```posh
cd deps
.\deps.ps1
```

> The scripts will install Chocolatey, node.js, and WebPI if necessary.

---

## Project Structure

```md
.
├── alacritty
│   └── alacritty.yml
├── bash
│   ├── .bash_aliases
│   ├── .bash_profile
│   ├── .bashrc
│   └── .profile
├── bin
├── deps
│   └── deps.ps1
├── docs
│   ├── docs.md
│   ├── theme.md
│   └── tools.md
├── git
│   ├── .gitconfig
│   └── .gitignore
├── nvim
│   └── init.vim
├── pulseaudio
├── pwsh
├── setup
│   └── install.ps1
├── wt
│   └── profiles.json
├── .editorconfig
├── .gitignore
├── .gitmodules
├── LICENSE
├── package.json
└── README.md
```

---
