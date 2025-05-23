return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  event = { "BufReadPre", "BufNewFile" },
  init = function()
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
  end,
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.pyright.setup({
      capabilities = capabilities,
      -- Disable some settings when using alongside Ruff
      -- https://github.com/astral-sh/ruff-lsp/issues/384
      settings = {
        pyright = {
          disableOrganizeImports = true,
          disableTaggedHints = true,
        },
        python = {
          analysis = {
            diagnosticSeverityOverrides = {
              -- https://github.com/microsoft/pyright/blob/main/docs/configuration.md#type-check-diagnostics-settings
              reportUndefinedVariable = "none",
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      },

    })

    lspconfig.ruff.setup({
      capabilities = capabilities,
    })
  end
}
