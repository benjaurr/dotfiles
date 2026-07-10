#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# Install Homebrew dependencies
BREW_DEPS=(jq lazygit colima docker docker-compose)
BREW_CASKS=(karabiner-elements ghostty)

if command -v brew &>/dev/null; then
    echo "Installing dependencies via Homebrew..."
    brew install "${BREW_DEPS[@]}"
    brew install --cask "${BREW_CASKS[@]}"
else
    echo "Warning: Homebrew not found. Please install the following dependencies manually:"
    printf '  - %s\n' "${BREW_DEPS[@]}" "${BREW_CASKS[@]}"
fi

echo ""

create_symlink() {
    local source="$1"
    local target="$2"

    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target to ${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -s "$source" "$target"
    echo "Linked $source -> $target"
}

# Neovim
create_symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

# Ghostty
create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

# Claude
create_symlink "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
create_symlink "$DOTFILES_DIR/claude/statusline.sh" "$HOME/.claude/statusline.sh"

# Codex
create_symlink "$DOTFILES_DIR/codex/config.toml" "$HOME/.codex/config.toml"

# Git
create_symlink "$DOTFILES_DIR/git/gitconfig" "$HOME/.gitconfig"

# Colima (template used when creating new colima instances)
create_symlink "$DOTFILES_DIR/colima/default.yaml" "$HOME/.colima/_templates/default.yaml"

# Karabiner
create_symlink "$DOTFILES_DIR/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"

echo ""
echo "Dotfiles installed successfully!"
