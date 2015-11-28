#!/usr/bin/env sh

DOTFILES=(".gitconfig"
          ".mdastrc"
          ".zpreztorc"
          ".zprofile"
          ".zshenv"
          ".zshrc")

for dotfile in "${DOTFILES[@]}"
do
  ln -sf $HOME/.dotfiles/$dotfile $HOME/$dotfile
done
