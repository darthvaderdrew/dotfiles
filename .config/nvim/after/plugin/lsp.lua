local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'pyright', 'ruff', 'jdtls', 'clangd'},
  handlers = {
    lsp_zero.default_setup,
      function(server_name)
          require('lspconfig')[server_name].setup({})
      end,
    jdtls = lsp_zero.noop,
  },
})

-- disable pyright diagnostics
-- require("lspconfig").pyright.setup({
--   capabilities = capabilities,
--   handlers = {
--     ["textDocument/publishDiagnostics"] = function() end,
--   },
-- })

lsp_zero.set_sign_icons({
  error = '󰅚',
  warn = '󰀪',
  hint = '󰌶',
  info = '󰋽'
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  })
})
