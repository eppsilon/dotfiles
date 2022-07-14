#!/usr/bin/env sh

DOTFILES=(".gitconfig"
          ".prompt.zsh"
          ".remarkrc"
          ".zprofile"
          ".zshenv"
          ".zshrc"
          "Library/Application Support/Beyond Compare/BCColors.xml"
          "Library/Application Support/Beyond Compare/BCFileFormats.xml"
          "Library/Application Support/Beyond Compare/BCPreferences.xml"
          "Library/Application Support/Code/User/settings.json")

DOTDIRS=()

for dotdir in "${DOTDIRS[@]}"
do
  mkdir -p "$dotdir"
done

for dotfile in "${DOTFILES[@]}"
do
  ln -sf "$HOME/.dotfiles/$dotfile" "$HOME/$dotfile"
done
