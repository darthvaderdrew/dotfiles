local lsp = vim.lsp

lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
})

-- Python
lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = {
        "pyrightconfig.json",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "requirements.txt",
        ".git",
    },
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
    },
})

lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = {
        "pyproject.toml",
        "ruff.toml",
        ".ruff.toml",
        ".git",
    },
})

-- Lua
lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = {
        { ".luarc.json", ".luarc.jsonc" },
        ".git",
    },
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            workspace = {
                library = { vim.env.VIMRUNTIME },
            },
        },
    },
})

-- Prefer Pyright for hover and Conform for formatting
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
        end
    end,
})

-- Enable language servers
lsp.enable({ "pyright", "ruff", "lua_ls" })

-- Diagnostics
local severity = vim.diagnostic.severity

vim.diagnostic.config({
    virtual_text = {
        spacing = 2,
        source = "if_many",
    },
    signs = {
        text = {
            [severity.ERROR] = "",
            [severity.WARN] = "",
            [severity.INFO] = "",
            [severity.HINT] = "󰌵",
        },
    },
    severity_sort = true,
    update_in_insert = false,
})
