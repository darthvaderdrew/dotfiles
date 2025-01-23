return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },
  init = function()
  -- set showmode to false
  -- this prevents having two statuslines at once
    vim.opt.showmode = false
  end,
  opts = {
    options = {
      theme = "gruvbox",
      icons_enabled = true,
    },
    sections = {
      lualine_a = {
        "mode"
      },
      lualine_b = {
        "branch",
        "diff",
        "diagnostics",
        "buffers",
      },
      lualine_c = {
        -- "filename",
      },
      lualine_x = {
        -- "encoding",
        -- "fileformat",
        "filetype",
      },
      lualine_y = {
        "progress",
      },
      lualine_z = {
        "location",
      },
    },
  },
}
