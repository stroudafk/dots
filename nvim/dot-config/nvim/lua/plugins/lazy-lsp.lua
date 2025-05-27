-- Nix aware alternative to nvim-lsp-installer/mason.nvim. Auto installs lsp servers in nvim.
return {
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
}
