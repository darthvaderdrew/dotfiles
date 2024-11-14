return {
  "stevearc/conform.nvim",
  -- lazy load
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = { timeout_ms = 500 },
    formatters = {
      black = {
        prepend_args = { "--line-length", "120" },
      }
    },
    -- Set conform log level
    -- Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
    -- Level numbers begin with "TRACE" at 0
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
