# Personal Dotfiles

## `.emacs.d`

Integrated `Jeamcs` repository to here.

### system dependency

on MacOS, you can install GUI version emacs with `brew install --cask emacs`.

```bash
ln -sv /git/repo/location/.emacs.d ~/.emacs.d
```

## `.gnupg/gpg.conf`

Added Preferred keyserver

### system dependency

on MacOS, you'll need `gnupg`, `pinentry-mac`.

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
