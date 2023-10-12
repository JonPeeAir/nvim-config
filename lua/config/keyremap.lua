-- Oil.nvim keybinds
vim.keymap.set('n', '<leader>e', require("oil").toggle_float);

-- Telescope keybinds
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = "Search buffers" })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = "Search help" })

-- Buffer keybinds
vim.keymap.set('n', ']b', '<cmd>bn<cr>')
vim.keymap.set('n', '[b', '<cmd>bp<cr>')

-- Other
vim.keymap.set("n", "<c-j>", "15j")
vim.keymap.set("n", "<c-k>", "15k")

