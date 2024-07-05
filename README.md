# Personal Dotfiles

## `/.config/nvim`

`Neovim` configuration

### system dependency

`ripgrep`, `fd`

```bash
ln -sv /git/repo/location/.config/nvim ~/.config/nvim
```

## `.emacs.d`

Integrated `Jeamcs` repository to here.

There are two `init.el` file. One is `modular-init.el` which will use
modules under the `lisp` directory. Another one is combined `init` file.
(Modular one is not updated from 24/07/05)

### system dependency

- on MacOS, you can install GUI version emacs with `brew install --cask emacs`.

```bash
ln -sv /git/repo/location/.emacs.d ~/.emacs.d
```

## `.gnupg/gpg.conf`

Added Preferred keyserver

### system dependency

on MacOS, you'll need

- `gnupg`
- `pinentry-mac`.

## `.gitconfig`

`Git` config files

## `.vimrc`

minimal vim config file

```bash
ln -sv /git/repo/location/.vimrc ~/.vimrc
```

## `.zprofile`, `.zshrc`

.

## `Brewfile`

### system dependency

`hoembrew`.
Generated with


```bash
brew bundle dump --file=./Brewfile
```

On a new machine, install all programs with

```bash
brew bundle install --file=./Brewfile
```
