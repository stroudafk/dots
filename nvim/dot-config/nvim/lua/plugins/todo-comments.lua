-- Highlight TODO comments
return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    signs = false, -- don't show signs in the 'signs' column
  }
}

