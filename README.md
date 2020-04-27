# dotfiles

> My personal system configuration files commonly known as .files (dotfiles).

---

## Documentation

- [`docs`](./docs/docs.md)
- [`theme`](./docs/theme.md)
- [`tools`](./docs/theme.md)

---

## Usage Instructions

CLone the repository:

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

Install all dependencies:

```powershell
cd deps
.\deps.ps1
```

Initialize `Git` submodules:

```powershell
git submodule update --init --recursive
```

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
├── deps
│   └── deps.ps1
├── docs
│   ├── docs.md
│   ├── theme.md
│   └── tools.md
├── git
│   ├── .gitconfig
│   └── .gitignore
├── music
├── nvim
│   └── init.vim
├── pwsh
├── utils
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
