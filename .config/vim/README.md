# Vim

## Dependencies

Install [vim-plug](https://github.com/junegunn/vim-plug) to manage plugins.

```sh
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Setup

Install plugins:

```vim
:PlugInstall
```

## Maintenance

Update plugins:

```vim
:PlugUpdate
```

Update vim-plug:

```vim
:PlugUpgrade
```

Remove unused plugins:

```vim
:PlugClean
```
