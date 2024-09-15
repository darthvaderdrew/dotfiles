return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
    },
    formatters = {
      black = {
        prepend_args = { "--line-length", "120" },
      }
    },
    log_level = vim.log.levels.OFF
  },

  config = function(_, opts)
    require("conform").setup(opts)
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end,
}
