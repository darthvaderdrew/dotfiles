return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "java",
        "jsdoc",
        "jsonc",
        "json",
        "luadoc",
        "luap",
        "lua",
        "markdown_inline",
        "markdown",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vimdoc",
        "vim",
        "xml",
        "yaml",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      })
  end,
}
