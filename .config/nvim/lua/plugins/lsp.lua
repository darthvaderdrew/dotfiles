return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        -- Set mason log level
        -- Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
        -- Level numbers begin with "TRACE" at 0
        log_level = vim.log.levels.OFF
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    cmd = {"LspInfo", "LspInstall", "LspStart"},
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = "yes"
      -- Set lsp log level
      -- Levels by name: "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "OFF"
      -- Level numbers begin with "TRACE" at 0
      vim.lsp.set_log_level("OFF")
      -- Diagnostics config
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
      })
    end,
    config = function()
      local lsp_defaults = require("lspconfig").util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = {buffer = event.buf}

          vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
          vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
          vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
          vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
          vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
          vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
          vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
          vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
          vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
          vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        end,
      })

      local noop = function() end

      require("mason-lspconfig").setup({
        ensure_installed = {
          "ruff",
          "jdtls",
        },
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,

          -- this is the "custom handler" for `jdtls`
          -- noop is an empty function that doesn't do anything
          jdtls = noop,
        }
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          "isort",
          "black",
        },
      })

      -- set custom diagnostic symbols in the sign column (gutter)
      local signs = { Error = "󰅚", Warn = "󰀪", Hint = "󰌶", Info = "󰋽" }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

    end
  }
}
