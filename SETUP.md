# Setting up a machine from scratch

Full walkthrough for bootstrapping a brand-new Mac, where nothing is available yet — no `brew`, no `gh`, not even `git`.

## 1. Xcode Command Line Tools

macOS ships without dev tools (`git`, compilers, etc.), so install them first:

```bash
xcode-select --install
```

(Running `git` before this also triggers the same installer prompt.)

## 2. Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then **open a new terminal window** — `brew` won't be on your PATH in the current one (the installer adds `/opt/homebrew/bin` via `/etc/paths.d/homebrew`, which only applies to new shells).

## 3. GitHub CLI + clone

```bash
brew install gh
gh auth login
gh repo clone benjaurr/dotfiles ~/Desktop/dotfiles
```

## 4. Install script

```bash
cd ~/Desktop/dotfiles
./install.sh
```

This installs all the Homebrew dependencies listed in the [README](README.md) (formulae + casks) and symlinks the config files to their expected locations. Existing configs are backed up with a `.bak` extension, so it's safe to re-run.

## 5. `.zshrc` (manual copy)

The `.zshrc` is deliberately **not** tracked in this repo since it can contain secrets (API keys, tokens, work-specific env vars). Copy it over manually from the old machine, e.g.:

```bash
# from the old machine
scp ~/.zshrc <new-machine>:~/.zshrc
```

or transfer it through a password manager / AirDrop — just don't commit it here. It expects `nodenv`, `rbenv`, and `direnv` to be installed, which `install.sh` takes care of.

> Tip: keeping secrets in 1Password (and loading them via `op` or per-project `direnv`) instead of hardcoding them in `.zshrc` would make the file safe to track like the rest of these configs.

## 6. Claude Code

```bash
curl -fsSL https://claude.ai/install.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

The installer puts `claude` in `~/.local/bin`, which isn't on the PATH by default — hence the second line.

## 7. Nerd Font

The terminal setup (nvim icons, statusline glyphs) needs a [Nerd Font](https://www.nerdfonts.com/font-downloads). Download one from that page, unzip it, and double-click the `.ttf` files (or drop them into Font Book) to install.

Alternatively, install one via Homebrew:

```bash
brew install --cask font-jetbrains-mono-nerd-font
```

Then select it in Ghostty (`font-family` in the config) if it isn't picked up automatically.
