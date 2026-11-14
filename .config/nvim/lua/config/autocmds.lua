local api = vim.api

local group = api.nvim_create_augroup("UserConfig", { clear = true })

-- Highlight trailing whitespace
local function set_whitespace_highlight()
    api.nvim_set_hl(0, "TrailingWhitespace", {
        bg = "#cc241d",
    })
end

set_whitespace_highlight()

api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = set_whitespace_highlight,
})

api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
    group = group,
    callback = function()
        if vim.bo.buftype ~= "" then
            return
        end

        for _, match in ipairs(vim.fn.getmatches()) do
            if match.group == "TrailingWhitespace" then
                return
            end
        end

        vim.fn.matchadd("TrailingWhitespace", [[\s\+$]])
    end,
})

-- Remove trailing whitespace
api.nvim_create_user_command("TrimWhitespace", function()
    local view = vim.fn.winsaveview()
    vim.cmd([[keeppatterns keepjumps %s/\s\+$//e]])
    vim.fn.winrestview(view)
end, { desc = "Remove trailing whitespace" })

-- Don't automatically continue comments on new lines
api.nvim_create_autocmd("FileType", {
    group = group,
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})
