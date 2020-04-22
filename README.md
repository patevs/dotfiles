# dotfiles

> My personal system configuration files commonly known as .files (dotfiles).

---

## Documentation

- [`docs`](./docs/docs.md)
- [`theme`](./docs/theme.md)
- [`tools`](./docs/theme.md)

---

## Installation

CLone the repository

```powershell
git clone https://github.com/patevs/dotfiles.git
cd dotfiles
```

Install PowerShell profile. Tested with PowerShell `5.1` and `7.0`

```powershell
cd pwsh
.\bootstrap.ps1
```

Install Dependencies

```powershell
cd deps
.\deps.ps1
```

Install Git global configuration

```powershell
cd git
.\bootstrap.ps1
```

Install NeoVim profile

```powershell
cd nvim
.\bootstrap.ps1
```

Initialize Git SUbmodule

```powershell
git submodule update --init --recursive
```

---

## Project Structure

```md
.
├── alacritty
│  └── alacritty.yml
├── bash
│  ├── .bash_aliases
│  ├── .bash_profile
│  ├── .bashrc
│  └── .profile
├── deps
│  └── deps.ps1
├── docs
│  ├── docs.md
│  ├── theme.md
│  └── tools.md
├── git
├── nvim
│  └── init.vim
├── pwsh
├── utils
├── wt
|  └── profiles.json
├── .editorconfig
├── .gitmodules
├── LICENSE
├── package.json
└── README.md
```

---
