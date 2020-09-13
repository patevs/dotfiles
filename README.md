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

```bash
git clone https://github.com/patevs/dotfiles.git
cd dotfiles
```

Install `Bash` profile:

```bash
cd bash
.\bootstrap.sh
```

Install global `Git` configuration:

```bash
cd git
.\bootstrap.sh
```

Install `Neovim` profile:

```bash
cd nvim
.\bootstrap.sh
```

<!--
Initialize `Git` submodules:

```powershell
git submodule update --init --recursive
```
-->

---

## Project Structure

```md
.
├── alacritty           # Alacritty profile
│   └── alacritty.yml
├── bash                # Bash profile
│   ├── .bash_aliases
│   ├── .bash_profile
│   ├── .bashrc
│   └── .profile
├── bat
├── bin
├── deps
│   └── deps.ps1
├── docs                # Documentation
│   ├── docs.md
│   ├── theme.md
│   └── tools.md
├── git                 # Global Git configuration
│   ├── .gitconfig
│   └── .gitignore
├── nvim                # Neovim profile
│   └── init.vim
├── pulseaudio
├── scripts
├── wt                  # Windows Terminal profile
│   └── profiles.json
├── .editorconfig       # Editor configuration
├── .gitignore          # Git ignore rules
├── .gitmodules         # Git modules
├── .np-config.json     # NPM publish (np) configuration
├── LICENSE             # Project LICENSE
├── package.json        # NPM package configuration
└── README.md           # Project README
```

---
