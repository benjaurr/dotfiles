# Dotfiles

Configuration files for my dev environment.

## What's included

- **Neovim** - LazyVim-based config
- **Zellij** - Terminal multiplexer config
- **Ghostty** - Terminal emulator config
- **Claude** - Settings and statusline script

## Installation

```bash
git clone git@github.com:<username>/dotfiles.git ~/Desktop/dotfiles
cd ~/Desktop/dotfiles
./install.sh
```

The install script creates symlinks from the config files to their expected locations. Existing configs are backed up with a `.bak` extension.
