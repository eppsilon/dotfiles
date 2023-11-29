#!/usr/bin/env bash

if [ ! -d '/opt/homebrew' ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
  broot \
  direnv \
  dotnet \
  exa \
  git \
  git-delta \
  git-interactive-rebase-tool \
  mcfly \
  openjdk \
  wakeonlan \
  yarn

brew install --cask \
  1password \
  alfred \
  arc \
  beyond-compare \
  daisydisk \
  discord \
  figma \
  font-fira-code \
  httpie \
  istat-menus \
  iterm2 \
  jetbrains-toolbox \
  steam \
  telegram \
  visual-studio-code

cd ~/.node-cli
yarn
