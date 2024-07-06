# Personal Dotfiles

Repo includes below

## Neovim config

### system dependency

- `ripgrep`
- `fd`

```bash
ln -sv /git/repo/location/.config/nvim ~/.config/nvim
```

## Emacs config

Integrated `Jeamcs` repository to here.

There are two `init.el` file. One is `modular-init.el` which uses
modules under the `lisp` directory. Another one is combined `init` file.
(Modular one is not updated from 24/07/05)

### system dependency

- on MacOS, you can install GUI version emacs with `brew install --cask emacs`.

```bash
ln -sv /git/repo/location/.emacs.d ~/.emacs.d
```

## GnuPG config

Added preferred keyserver

### system dependency

on MacOS, you'll need

- `gnupg`
- `pinentry-mac`.

## Git config


## Vim config

```bash
ln -sv /git/repo/location/.vimrc ~/.vimrc
```

## zsh config

## Homebrew package lsit

### system dependency

- `homebrew`.

Generated with

```bash
brew bundle dump --file=./Brewfile
```

On a new machine, install all programs with

```bash
brew bundle install --file=./Brewfile
```
