# Neovim

Requires Neovim 0.12+.

## Dependencies

Install the following tools and ensure they're available on `$PATH`:

- `git` - Plugin management
- `fzf` - Fuzzy finding
- `ripgrep` (`rg`) - Project searching and file discovery
- `tree-sitter` CLI (>= 0.26.1) - Parser installation
- C compiler, `curl`, `tar` - Parser compilation and installation
- `pyright` - Python language server
- `ruff` - Python linting and formatting
- `lua-language-server` - Lua language server

A [Nerd Font](https://www.nerdfonts.com/) is recommended for icons.

## Tree-sitter

Install parsers:

```vim
:TSInstall python bash json yaml toml markdown markdown_inline
```

Update parsers after updating nvim-treesitter:

```vim
:TSUpdate
```

## Maintenance

Update Neovim plugins:

```vim
:packupdate
```

Check for configuration or dependency issues:

```vim
:checkhealth
:ConformInfo
```
