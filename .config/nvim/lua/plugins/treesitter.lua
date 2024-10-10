return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "markdown",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "javascript",
        "html",
        "diff",
        "python",
        "java",
        "bash"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      })
  end,
}
