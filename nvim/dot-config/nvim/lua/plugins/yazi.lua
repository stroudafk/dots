-- Integration for yazi in nvim
---@type LazySpec
-- TODO: confirm keybindings
return
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "ibhagwan/fzf-lua" , lazy = true },
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>.",
      -- "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>e",
      -- "<leader>-",
      -- "<leader>.",
      mode = { "n", "v" },
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      -- "<c-up>",
      "<a-u>", -- alternative to ctrl u that doesn't conflict with mac bindings
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
    integrations = {
      grep_in_directory = "fzf-lua",
      grep_in_selected_files = "fzf-lua",
    },
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    -- vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
}
