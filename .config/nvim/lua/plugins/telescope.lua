return {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
  cmd = { "Telescope" },
  keys = {
    { "<leader>ff", desc = "Telescope find files" },
    { "<leader>fg", desc = "Telescope live grep" },
    { "<leader>fb", desc = "Telescope buffers" },
    { "<leader>fh", desc = "Telescope help tags" },
    { "<leader>fd", desc = "Telescope diagnostics" },
    { "<leader>ft", desc = "Telescope treesitter" },
  },
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
  },

  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fd", function() builtin.diagnostics({ bufnr = 0}) end, { desc = "Telescope diagnostics" })
    vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Telescope treesitter" })

    -- telescope options
    require("telescope").setup {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require("telescope").load_extension("fzf")
  end,
}
