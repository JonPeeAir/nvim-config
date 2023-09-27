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
		config = function()
			require("oil").setup()
		end
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
				clear_empty_lines = false,
			})
		end,
	}
}
