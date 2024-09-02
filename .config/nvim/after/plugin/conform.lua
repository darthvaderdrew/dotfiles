require("conform").setup({
  formatters_by_ft = {
    python = { "black", "isort" },
    java = { "google-java-format" },
    c = { "clang_format" }
  },
  formatters = {
      black = {
          prepend_args = { "--line-length", "120" },
      }
  },
  log_level = vim.log.levels.OFF
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
