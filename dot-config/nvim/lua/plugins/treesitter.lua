-- Syntax highlighting
return {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {"c", "cpp", "lua", "vim", "vimdoc", "markdown", "markdown_inline", "java", "javadoc", "javascript", "json", "html", "python"},
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },
        })
      end,
}
