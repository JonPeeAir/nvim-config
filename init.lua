require("config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
print(lazypath)
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- plugins
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "rebelot/kanagawa.nvim"
},{
  --opts
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json"
})

vim.cmd("colorscheme kanagawa")

