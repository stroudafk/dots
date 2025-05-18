-- Simple file tree browser
return {
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
}
