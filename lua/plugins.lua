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
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "jsdoc",
        "json",
        "jsonc",
        "yaml",
        "c",
        "cpp",
        "rust",
        "dockerfile",
        "hurl"
      },
    }
  },

  -- -- {
  -- --   "rebelot/kanagawa.nvim",
  -- --   config = function()
  -- --     vim.cmd("colorscheme kanagawa")
  -- --   end,
  -- -- },

  -- -- {
  -- --   "morhetz/gruvbox",
  -- --   config = function()
  -- --     vim.cmd("colorscheme gruvbox")
  -- --   end,
  -- -- },

  -- {
  --   'nyngwang/nvimgelion',
  --   config = function ()
  --     vim.cmd("colorscheme nvimgelion")
  --   end
  -- },

  -- {
  --   'catppuccin/nvim',
  --   name = "catppuccin",
  --   config = function ()
  --     require("catppuccin").setup({
  --       transparent_background = true, -- disables setting the background color.
  --     })
  --
  --     vim.cmd("colorscheme catppuccin-mocha")
  --   end
  -- },

  {
    'folke/tokyonight.nvim',
    config = function ()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })

      vim.cmd("colorscheme tokyonight")
    end
  },


  {
    "nvim-tree/nvim-web-devicons"
  },

  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set('n', '<leader>e', "<cmd>Oil<cr>")
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local Telescope = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', Telescope.find_files, { desc = "Find files" })
      vim.keymap.set('n', '<leader>fg', Telescope.live_grep, { desc = "Live grep" })
      vim.keymap.set('n', '<leader>fb', Telescope.buffers, { desc = "Search buffers" })
      vim.keymap.set('n', '<leader>fh', Telescope.help_tags, { desc = "Search help" })
    end,
  },

  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
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
      vim.keymap.del({'x', 'o'}, 'x')
      vim.keymap.del({'x', 'o'}, 'X')
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
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  {
    'windwp/nvim-ts-autotag',
    opts = {}, -- this is equalent to setup({}) function
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "tailwindcss",
          "jsonls",
          "lua_ls",
          "pyright",
          "clangd",
          "rust_analyzer",
          "yamlls"
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local opts = { noremap = true, silent = true }
      local on_attach = function(client , bufnr)
        opts.buffer = bufnr

        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>d",vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set('n', 'gk', vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        vim.keymap.set('n', '<leader>rs', "<cmd>LspRestart<CR>", opts)

      end

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.pyright.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      lspconfig.tsserver.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      lspconfig.jsonls.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            }
          }
        }
      }

      lspconfig.clangd.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      lspconfig.rust_analyzer.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

      lspconfig.yamlls.setup {
        capabilities = capabilities,
        on_attach = on_attach
      }

    end,
  },


  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-k>'] = cmp.mapping.select_prev_item(),
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
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
    "numToStr/Comment.nvim",
    lazy = false,
    opts = {},
    config = function()
      vim.keymap.set('n', "<leader>/", function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end, {desc = "Toggle comment line"})
      vim.keymap.set('v', "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", {desc = "Toggle comment for selection"})
    end,
  },

}

