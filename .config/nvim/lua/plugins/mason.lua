return {
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  lazy = false,
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      },
      log_level = vim.log.levels.OFF
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        -- language servers
        "pyright",
        "ruff",
        "jdtls",
        "lua-language-server",

        -- tools
        "isort",
        "black",
        "yamllint",
        "sqlfluff",
      },
    })
  end,
}
