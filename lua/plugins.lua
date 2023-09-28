return {
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			highlight = {
				enable = true,
			},
			ensure_installed = { 
				"lua",
				"python",
				"markdown",
				"markdown_inline",
				"javascript",
				"typescript",
			},
		}
  },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },

	{
		"nvim-tree/nvim-web-devicons" 
	},

  {
    'stevearc/oil.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup()
		end,
  },

	{
    'nvim-telescope/telescope.nvim', 
		tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup({
				mapping = {"jk", "jj", "kk", "kj"},
				timeout = 250,
			})
		end,
	},

	{
		'akinsho/bufferline.nvim', 
		version = "*", 
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup()
		end,
	},

	{
		'ThePrimeagen/vim-be-good'
	},

	{
		"ggandor/leap.nvim",
		config = function()
			require('leap').add_default_mappings()
		end,
	},
	
	{
  "folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			vim.keymap.del("n", "S")
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	}
}
