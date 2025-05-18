-- Completion engine. Completion sources are installed from external repositories
return {
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
}
