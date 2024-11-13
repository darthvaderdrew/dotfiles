-- Set mapleader and make sure it's not mapped to anything else
vim.g.mapleader = " "
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })

-- Keymaps for built-in functions
vim.keymap.set("n", "<Tab>", vim.cmd.bnext, { silent = true, noremap = true })
vim.keymap.set("n", "<S-Tab>", vim.cmd.bprev, { silent = true, noremap = true })
vim.keymap.set("n", "<leader>l", vim.cmd.Lexplore, { silent = true, noremap = true })

-- Keymaps for custom functions
vim.keymap.set("n", "<leader>w", ":TrimWhitespace<CR>", { silent = true, noremap = true })
