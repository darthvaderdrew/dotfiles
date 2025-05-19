-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"
-- Set lsp log level
-- Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
vim.lsp.set_log_level("OFF")
-- Diagnostics config
vim.diagnostic.config({
  virtual_text = true,     -- display inline diagnostics
  underline = true,        -- underline text that has diagnostics
  update_in_insert = true, -- update in insert mode
  severity_sort = false,   -- sort diagnostics based on severity
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    },
  },
})

vim.lsp.enable({
  "ruff",
  "pyright",
  "jdtls",
})
