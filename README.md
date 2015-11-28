To install:

```sh
git clone ssh://git@github.com/eppsilon/dotfiles .dotfiles
git submodule update --init --recursive
./.dotfiles/install.sh
```

For sensitive or environment-specific stuff, add a `.user` file to override the main one. (Ex: `.gitconfig.user`.)

This repo depends on [Prezto]() for an excellent set of ZSH customizations. It also takes inspiration from
[YADR](https://github.com/skwp/dotfiles), a much more extensive collection of dotfiles.
