# Personal Dotfiles

## `.emacs.d`

Integrated `Jeamcs` repository to here.

```bash
ln -sv /git/repo/location/.emacs.d ~/.emacs.d
```

## `.gnupg/gpg.conf`

Added Preferred keyserver

## `.gitconfig`

`Git` config files

## `.gitignore`

.

## `.vimrc`

minimal vim config file

```bash
ln -sv /git/repo/location/.vimrc ~/.vimrc
```

## `.zprofile`, `.zshrc`

.

## `Brewfile`

Generated with

```bash
brew bundle dump --file=./Brewfile
```

On a new machine, install all programs with

```bash
brew bundle install --file=./Brewfile
```
