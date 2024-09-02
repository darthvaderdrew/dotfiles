require('lualine').setup {
    options = {
        theme= 'gruvbox',
        icons_enabled = true,
        -- component_separators = '|',
        -- section_separators = '',
    },
    sections = {
        lualine_b = {
            'branch', 'diff', 'diagnostics', 'buffers',
        },
        lualine_c = {
        },
        lualine_x = {
            'filetype',
        }
    }
}
