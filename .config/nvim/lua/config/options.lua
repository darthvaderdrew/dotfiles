-- Behavior
vim.opt.compatible = false
vim.opt.autoread = true -- automatically reload file if changes were made on disk
vim.opt.backspace = { "indent", "eol", "start" } -- fix backspacing
vim.opt.scrolloff = 8 -- number of scroll lines to keep above/below cursor
vim.opt.hidden = true -- allow editing multiple files without saving first
vim.opt.mouse = "a" -- enable mouse support in all modes
-- vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- Tabbing/indentation
vim.opt.tabstop = 2 -- set number of spaces for tabbing
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true -- make tabs spaces
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Searching
vim.opt.hlsearch = false -- highlight search results
vim.opt.incsearch = true -- dynamically highlight when searching
vim.opt.ignorecase = true -- case-insensitive searching
vim.opt.smartcase = true -- override ignorecase if search contains uppercase letters

-- Appearance
-- vim.opt.background = "dark"
vim.opt.title = true -- let nvim set terminal titlebar to the current file name
vim.opt.termguicolors = true -- enable full color suppot
-- vim.opt.showmode = false -- show mode in statusline
vim.opt.showcmd = true -- show commands in statusline
vim.opt.ruler = true
-- vim.opt.cursorline = true -- highlight the line the cursor is on
vim.opt.showmatch = false -- highlight matching parentheses
vim.opt.number = true -- display line numbers
vim.opt.relativenumber = true -- display line numbers relative to the cursor
vim.opt.wildmenu = true
vim.opt.wildmode = { "list:longest" }
-- vim.opt.signcolumn = "yes" -- enable signcolumn/gutter

-- use the same background as the current terminal
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])

-- highlight trailing whitespace red
vim.cmd([[highlight ExtraWhiteSpace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhiteSpace /\s\+$/]])

-- Directories
vim.opt.undofile = true -- set persistent undo
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo//") -- set directory for undo files
vim.opt.swapfile = true -- enable swapfile
vim.opt.directory = vim.fn.expand("~/.local/state/nvim/swap//") -- set directory for swap files
-- vim.opt.backup = true -- store backup of last write
vim.opt.backupdir = vim.fn.expand("~/.local/state/nvim/backups//") -- set directory for backup files
vim.opt.shadafile = vim.fn.expand("~/.local/state/nvim/shada/main.shada") -- set the shada file location
vim.g.netrw_dirhistmax = 0 -- disable netrwhist file
