#!/usr/bin/env sh

DOTFILES=(".gitconfig"
          ".prompt.zsh"
          ".remarkrc"
          ".zprofile"
          ".zshenv"
          ".zshrc"
          ".node-cli/.envrc"
          ".node-cli/.nvmrc"
          ".node-cli/package.json"
          ".node-cli/yarn.lock"
          "Library/Application Support/Beyond Compare/BCColors.xml"
          "Library/Application Support/Beyond Compare/BCFileFormats.xml"
          "Library/Application Support/Beyond Compare/BCPreferences.xml"
          "Library/Application Support/Code/User/settings.json")

DOTDIRS=(".node-cli")

for dotdir in "${DOTDIRS[@]}"
do
  mkdir -p "$HOME/$dotdir"
done

for dotfile in "${DOTFILES[@]}"
do
  if [[ "${dotfile:0:1}" == '.' ]]; then
    dotfile = ${dotfile:1}
  fi
  ln -sf "$HOME/.dotfiles/$dotfile" "$HOME/$dotfile"
done
