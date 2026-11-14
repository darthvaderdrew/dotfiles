vim.pack.add({
    -- Appearance
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",

    -- Editor
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/mbbill/undotree",

    -- Syntax
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    },

    -- Completion
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
})

local map = vim.keymap.set

-- Gruvbox
vim.cmd.colorscheme("gruvbox")

-- Lualine
require("lualine").setup({
    sections = {
        lualine_b = {
            "branch",
            "diff",
            {
                "diagnostics",
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = "󰌵 ",
                },
            },
        },
    },
    tabline = {
        lualine_a = { "buffers" },
    },
})

-- Gitsigns
require("gitsigns").setup()

-- fzf-lua
local fzf = require("fzf-lua")
fzf.setup()

map("n", "<leader>ff", fzf.files, { desc = "Find files" })
map("n", "<leader>fg", fzf.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", fzf.buffers, { desc = "Find buffers" })
map("n", "<leader>fh", fzf.helptags, { desc = "Find help" })
map("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })
map("n", "<leader>fR", fzf.resume, { desc = "Resume search" })
map("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Find document symbols" })
map("n", "<leader>fd", fzf.diagnostics_document, { desc = "Find diagnostics" })

-- Undotree
vim.g.undotree_SetFocusWhenToggle = 1

map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle undo tree" })

-- Treesitter
local treesitter_group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = treesitter_group,
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

        if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start(args.buf)
        end
    end,
})

-- Blink
require("blink.cmp").setup({
    keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },

    sources = {
        providers = {
            lsp = { fallbacks = {} },
        },
    },

    completion = {
        list = {
            selection = {
                preselect = false,
                auto_insert = true,
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 300,
        },
    },

    cmdline = {
        enabled = false,
    },
})

-- Conform
local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
    },

    format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end

        return {
            timeout_ms = 1000,
            lsp_format = "never",
        }
    end,
})

vim.api.nvim_create_user_command("Format", function()
    conform.format({ async = true, lsp_format = "never" })
end, { desc = "Format current buffer" })

vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
        vim.b.disable_autoformat = true
    else
        vim.g.disable_autoformat = true
    end
end, { bang = true, desc = "Disable format on save" })

vim.api.nvim_create_user_command("FormatEnable", function(args)
    if args.bang then
        vim.b.disable_autoformat = false
    else
        vim.g.disable_autoformat = false
    end
end, { bang = true, desc = "Enable format on save" })
