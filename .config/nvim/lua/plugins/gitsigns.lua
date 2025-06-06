return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require("gitsigns")
    gitsigns.setup()
    vim.keymap.set("n", "<leader>gs", gitsigns.toggle_signs, { silent = true, noremap = true })
  end,
}
