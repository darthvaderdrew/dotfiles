return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo", "Format", "FormatDisable", "FormatEnable" },
  opts = {
    formatters_by_ft = {
      python = { "isort", "black" },
      -- trim whitespace for files with no formatter available
      ["_"] = { "trim_whitespace", lsp_format = "prefer" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
    formatters = {
      black = {
        prepend_args = { "--line-length", "120" },
      },
    },
    -- Set conform log level
    -- Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
    log_level = vim.log.levels.OFF,
  },

  config = function(_, opts)
    require("conform").setup(opts)
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
        desc = "Re-enable autoformat-on-save",
      })
  end,
}
