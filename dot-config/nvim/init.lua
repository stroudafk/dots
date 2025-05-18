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

-- Set up lazy.nvim
require("lazy").setup({
  spec = {
    -- plugins here
    { import = "plugins" },
  },
  -- other settings here
  -- automatically check for plugin updates, but only once a day
  checker = { enabled = true, frequency = 86400, },
})
