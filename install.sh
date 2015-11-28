#!/usr/bin/env sh

DOTFILES=(".atom/config.cson"
          ".atom/keymap.cson"
          ".gitconfig"
          ".mdastrc"
          ".zpreztorc"
          ".zprofile"
          ".zshenv"
          ".zshrc"
          "coffeelint.json")

DOTDIRS=(".atom")

for dotdir in "${DOTDIRS[@]}"
do
  mkdir -p $dotdir
done

for dotfile in "${DOTFILES[@]}"
do
  ln -sf $HOME/.dotfiles/$dotfile $HOME/$dotfile
done
