-- intended to provide configs for all lsp related plugins
-- not to be confused with sources for completion in cmp.lua

return {
  {
    "neovim/nvim-lspconfig",
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      {"VonHeikemen/lsp-zero.nvim", branch = "v3.x"},
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-path",
    },

    config = function()
      local lsp_zero = require("lsp-zero").preset({})

      require("lspconfig").lua_ls.setup(lsp.build_options("lua_ls",
        lsp.build_options("lua_ls", {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        })
      )
    )

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
  }
}
