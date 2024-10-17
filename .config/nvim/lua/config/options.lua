-- Behavior
vim.opt.compatible = false
vim.opt.autoread = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.scrolloff = 8
vim.opt.hidden = true

-- Tabbing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Searching
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Appearance
vim.opt.termguicolors = true
-- vim.opt.showmode = false
vim.opt.showcmd = true
vim.opt.ruler = true
-- vim.opt.cursorline = true
vim.opt.showmatch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmenu = true
vim.opt.wildmode = { "list", "longest" }
-- vim.opt.signcolumn = "yes"

vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight ExtraWhiteSpace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhiteSpace /\s\+$/]])

-- Directories
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

-- LSP Options
-- vim.lsp.set_log_level("off")

-- Diagnostics config
-- vim.diagnostic.config({
--   virtual_text = true,
--   signs = true,
--   underline = true,
--   update_in_insert = true,
--   severity_sort = false,
-- })
