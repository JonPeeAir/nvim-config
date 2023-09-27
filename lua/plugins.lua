return {
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate"
  },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {},

--[[ Uncomment in case you need to remember what LazyPlugin means
    config = function(LazyPlugin, opts)
      print(vim.inspect(LazyPlugin))
    end,
]]
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  }
}
