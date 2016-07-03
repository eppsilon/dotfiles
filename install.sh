#!/usr/bin/env sh

DOTFILES=(".atom/.apmrc"
          ".atom/config.cson"
          ".atom/keymap.cson"
          ".atom/packages.txt"
          ".gitconfig"
          ".remarkrc"
          ".zprezto"
          ".zpreztorc"
          ".zprofile"
          ".zprofile.prezto"
          ".zshenv"
          ".zshrc"
          "coffeelint.json"
          "Library/Application Support/Beyond Compare/BCColors.xml"
          "Library/Application Support/Beyond Compare/BCFileFormats.xml"
          "Library/Application Support/Beyond Compare/BCPreferences.xml"
          "Library/Application Support/Code/User/settings.json")

DOTDIRS=(".atom")

for dotdir in "${DOTDIRS[@]}"
do
  mkdir -p "$dotdir"
done

for dotfile in "${DOTFILES[@]}"
do
  ln -sf "$HOME/.dotfiles/$dotfile" "$HOME/$dotfile"
done

apm uninstall
apm install --packages-file=$HOME/.atom/packages.txt
