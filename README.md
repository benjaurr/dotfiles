# Dotfiles

Configuration files for my dev environment.

## What's included

- **Neovim** - LazyVim-based config
- **Zellij** - Terminal multiplexer config
- **Ghostty** - Terminal emulator config
- **Git** - Global gitconfig (nvim as editor, gh credential helper, histogram diffs)
- **Claude** - Settings and statusline script
- **Codex** - Settings and plugin config
- **Colima** - Container runtime VM template (vz + virtiofs, 4 CPU / 6 GiB / 30 GiB)
- **Karabiner** - Keyboard customization (Caps Lock → Escape, both shifts → Caps Lock)

## Dependencies

- [jq](https://jqlang.github.io/jq/) - Used by the Claude statusline script for JSON parsing
- [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for git commands
- [colima](https://github.com/abiosoft/colima) - Container runtimes on macOS (with the docker CLI)
- [docker-compose](https://docs.docker.com/compose/) - Registered as a docker CLI plugin so `docker compose` works
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) - Keyboard customizer (cask)
- [Ghostty](https://ghostty.org/) - Terminal emulator (cask)

## Installation

```bash
git clone git@github.com:<username>/dotfiles.git ~/Desktop/dotfiles
cd ~/Desktop/dotfiles
./install.sh
```

The install script creates symlinks from the config files to their expected locations. Existing configs are backed up with a `.bak` extension.
