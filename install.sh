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
          "Library/Application Support/Beyond Compare/BCColors.xml"
          "Library/Application Support/Beyond Compare/BCFileFormats.xml"
          "Library/Application Support/Beyond Compare/BCPreferences.xml"
          "Library/Application Support/Code/User/settings.json")

DOTDIRS=(".node-cli"
         "Library/Application Support/Beyond Compare"
         "Library/Application Support/Code/User")

for dotdir in "${DOTDIRS[@]}"
do
  mkdir -p "$HOME/$dotdir"
done

for dotfile in "${DOTFILES[@]}"
do
  ln -sf "$HOME/.dotfiles/$dotfile" "$HOME/$dotfile"
done

touch "$HOME/.zprofile.user"

echo 'Now, run install-packages.sh to install Homebrew/NPM packages'
