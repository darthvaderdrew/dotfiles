local opt = vim.opt

-- Editing
opt.confirm = true
opt.scrolloff = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.wildmode = "list:longest"

-- Display
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.signcolumn = "yes"
opt.wrap = true
opt.linebreak = true
opt.showmode = false

-- Persistence
opt.undofile = true
vim.g.netrw_dirhistmax = 0

-- Windows
opt.splitright = true
opt.splitbelow = true
