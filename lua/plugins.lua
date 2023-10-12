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
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},

	{ 
		"lukas-reineke/indent-blankline.nvim", 
		main = "ibl", 
		opts = {} 
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			-- Set up lspconfig.
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			lspconfig.pyright.setup {}
			lspconfig.tsserver.setup {
				capabilities = capabilities
			}
			lspconfig.rust_analyzer.setup {
				-- Server-specific settings. See `:help lspconfig-setup`
				settings = {
					['rust-analyzer'] = {},
				},
			}

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
			vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
			vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
			vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set('n', '<space>wl', function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
					vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set('n', '<space>f', function()
						vim.lsp.buf.format { async = true }
					end, opts)
				end,
			})
		end,
	},

	{ 
		"hrsh7th/cmp-nvim-lsp" 
	},
	
	{ 
		"hrsh7th/cmp-buffer" 
	},

	{
		"hrsh7th/cmp-buffer" 
	},

	{
		"hrsh7th/cmp-cmdline" 
	},
	
	{
		"L3MON4D3/LuaSnip",
	},

	{
		"saadparwaiz1/cmp_luasnip"
	},

	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},

				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},

				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					-- { name = 'vsnip' }, -- For vsnip users.
					{ name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					-- { name = 'snippy' }, -- For snippy users.
				}, {
					{ name = 'buffer' },
				})
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
				})
			})

			-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})

			-- Set up lspconfig.
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			--[[
			require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
				capabilities = capabilities
			}
			--]]

		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {},
	}

	

}

