return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", lazy = true,
  },
  opts = {
    options = {
      theme = "gruvbox",
      icons_enabled = true,
    },
    sections = {
      lualine_b = {
        "branch",
        "diff",
        "diagnostics",
        "buffers",
      },
      lualine_c = {
      -- leave empty
      },
      lualine_x = {
        "filetype",
      },
    },
  },
}
