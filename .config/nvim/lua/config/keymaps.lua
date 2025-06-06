-- Set mapleader to space and make sure it's not mapped to anything else
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

-- Define custom keymaps
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { silent = true, noremap = true }) -- next buffer
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev, { silent = true, noremap = true }) -- previous buffer

vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { silent = true, noremap = true }) -- next diagnostic
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { silent = true, noremap = true }) -- previous diagnostic

vim.keymap.set("n", "<leader>l", vim.cmd.Lexplore, { silent = true, noremap = true }) -- open file explorer on the left

vim.keymap.set("n", "<leader>w", vim.cmd.TrimWhitespace, { silent = true, noremap = true }) -- delete all trailing whitespace
