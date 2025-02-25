-- file to set custom functions for neovim

local M = {}

-- delete all trailing whitespace in a file
function M.trim_whitespace()
    local current_state = vim.fn.winsaveview()
    vim.cmd("%s/\\s\\+$//e")
    vim.fn.winrestview(current_state)
end
vim.api.nvim_create_user_command("TrimWhitespace", M.trim_whitespace, {})

-- toggle diagnostics display
function M.toggle_diagnostics()
    local current_state = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({
        virtual_text = not current_state,
        signs = not current_state,
        underline = not current_state,
    })
end
vim.api.nvim_create_user_command("ToggleDiagnostics", M.toggle_diagnostics, {})

return M
