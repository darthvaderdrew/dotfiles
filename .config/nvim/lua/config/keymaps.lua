local map = vim.keymap.set

-- Buffers
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- File explorer
map("n", "<leader>l", "<cmd>Lexplore<cr>", { desc = "Toggle file explorer" })

-- Command line
map("c", "<C-a>", "<Home>", { desc = "Beginning of command line" })
map("c", "<C-d>", "<Del>", { desc = "Delete character under cursor" })
