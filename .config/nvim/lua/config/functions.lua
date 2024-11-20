-- file to set custom functions for neovim

local M = {}

-- delete all trailing whitespace in a file
function M.TrimWhitespace()
    local save = vim.fn.winsaveview()
    vim.cmd("%s/\\s\\+$//e")
    vim.fn.winrestview(save)
end

-- Define custom commands
vim.api.nvim_create_user_command("TrimWhitespace", function()
    M.TrimWhitespace()
end, {})

return M
