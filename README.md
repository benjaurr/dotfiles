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

- [neovim](https://neovim.io/) - Editor (the nvim config is useless without it)
- [jq](https://jqlang.github.io/jq/) - Used by the Claude statusline script for JSON parsing
- [lazygit](https://github.com/jesseduffield/lazygit) - Terminal UI for git commands
- [colima](https://github.com/abiosoft/colima) - Container runtimes on macOS (with the docker CLI)
- [docker-compose](https://docs.docker.com/compose/) - Registered as a docker CLI plugin so `docker compose` works
- [nodenv](https://github.com/nodenv/nodenv) - Node version manager (initialized in `.zshrc`)
- [rbenv](https://github.com/rbenv/rbenv) - Ruby version manager (initialized in `.zshrc`)
- [direnv](https://direnv.net/) - Per-directory environment variables (hooked in `.zshrc`)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) - Keyboard customizer (cask)
- [Ghostty](https://ghostty.org/) - Terminal emulator (cask)

## Installation

```bash
gh repo clone benjaurr/dotfiles ~/Desktop/dotfiles
cd ~/Desktop/dotfiles
./install.sh
```

The install script installs the Homebrew dependencies and creates symlinks from the config files to their expected locations. Existing configs are backed up with a `.bak` extension.

Setting up a brand-new Mac with nothing installed yet? Follow [SETUP.md](SETUP.md) for the full from-scratch walkthrough.
