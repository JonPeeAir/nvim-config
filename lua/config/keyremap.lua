-- Oil.nvim keybinds
vim.keymap.set('n', '<leader>e', require("oil").toggle_float);

-- Telescope keybinds
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)

-- Buffer keybinds
vim.keymap.set('n', ']b', '<cmd>bn<cr>')
vim.keymap.set('n', '[b', '<cmd>bp<cr>')

-- Other
vim.keymap.set("n", "<c-j>", "15j")
vim.keymap.set("n", "<c-k>", "15k")

