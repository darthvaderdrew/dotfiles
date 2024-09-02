vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

  use({
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup()
    end,
  })

  use 'mfussenegger/nvim-jdtls'

  use "lukas-reineke/indent-blankline.nvim"

  use 'nvim-tree/nvim-web-devicons'

  -- use {
  --     "windwp/nvim-autopairs",
  --     config = function() require("nvim-autopairs").setup {} end
  -- }

--   use({
--     "kylechui/nvim-surround",
--     tag = "*", -- Use for stability; omit to use `main` branch for the latest features
--     config = function()
--         require("nvim-surround").setup({
--             -- Configuration here, or leave empty to use defaults
--         })
--     end
-- })

end)
