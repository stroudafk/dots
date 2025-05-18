require("core")

-- Bootstrap lazy.nvim. So I think it clones the repo if not present?
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..."},
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
--  Vim options
--  set up mapleader (and maplocalleader if needed) before loading lazy.nvim so that mappings are correct

--vim.lsp.enable('marksman')

-- Set up lazy.nvim
require("lazy").setup({
  spec = {
    -- plugins here
    { import = "plugins" },
    
    {
      --"folke/tokyonight.nvim",
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,
      priority = 1000, -- load before all other start plugins
      opts = { style = "storm" },
      config = function()
        -- load colorscheme here???
        vim.cmd.colorscheme('catppuccin-mocha')
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      lazy = false,
      config = function()
        require("lualine").setup({
          options = {
            theme = "palenight",
          },
        })
      end,
    },
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" }, -- icon support. optional
      opts = {}
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim", -- image support in preview windows. optional
      },
      lazy = false, -- neo tree apparently will lazy load itself
      ---@module "neo-tree"
      ---@type neotree.Config?
      opts = {
        -- options :D
      },
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        signs = false, -- don't show signs in the 'signs' column
      }
    },
    {
      "neovim/nvim-lspconfig",
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
      },
      -- require'lspconfig'.lua_ls.setup {
      --   settings = {
      --     lua = {
      --       runtime = {
      --         version = 'LuaJIT',
      --       },
      --       diagnostics = {
      --         globals = {
      --           'vim',
      --           'require'
      --         },
      --         workspace = {
      --           library = vim.api.nvim_get_runtime_file("", true),
      --         },
      --         telemetry = {
      --           enable = false,
      --         },
      --       },
      --     },
      --   },
      -- }
    },
    {
      "hrsh7th/nvim-cmp",
      config = function()
        local cmp = require'cmp'
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
          sources = cmp.config.sources({
            { name = 'render-markdown' },
          }),
          snippet = {
            expand = function(args)
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

        -- For `mini.snippets` users:
        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
        -- insert({ body = args.body }) -- Insert at cursor
        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
        -- require("cmp.config").set_onetime({ sources = {} })
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = false}), -- Accept explicitly selected item
          ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
          { name = 'path'},
        }--,
        --{
          --{ name = 'buffer' },
        --}
      )
        })
      end
    },
    {
      "dundalek/lazy-lsp.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-path",
      },

      config = function()
        local lsp_zero = require("lsp-zero")

        lsp_zero.on_attach(
          function(client, bufnr)
            lsp_zero.default_keymaps({
              buffer = bufnr,
              preserve_mappings = false
            })
          end
        )

        require("lazy-lsp").setup{}
      end,
    },
    --[[{
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = { 'rafamadriz/friendly-snippets' },

      -- use a release tag to download pre-built binaries
      version = '1.*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = { preset = 'default' },

        appearance = {
          -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = { 
          documentation = { auto_show = false }, 
          menu = { draw = { treesitter = { 'lsp' } } },
          ghost_text = { enabled = true },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        --  (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
      },
      opts_extend = { "sources.default" }
    }--]]


    -- lsp

    -- java

    -- md

  },
  -- other settings here


  -- color scheme
  --install = { colorscheme = { "habamax" } },
  --install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates, but only once a day
  checker = { enabled = true, frequency = 86400, },
})
