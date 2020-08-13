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
├── bat
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
├── scripts
├── wt
│   └── profiles.json
├── .commitlintrc.json
├── .editorconfig
├── .gitignore
├── .gitmodules
├── .huskyrc
├── .np-config.json
├── LICENSE
├── package.json
└── README.md
```

---
