vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.syntax="on"
vim.opt.showmatch=true --highlight matching brackets
vim.o.showmode = false

-- fix lsp not recognizing library = vim.api.nvim_get_runtime_file("", true),
-- vim.diagnostic.config({
--   virtual_text = {
--     source = "always",
--   },
-- })

vim.opt.termguicolors=true

-- indent settings
vim.opt.tabstop=2 --number of spaces a tab counts for and maybe shows as?
vim.opt.shiftwidth=0 -- num of spaces to use for each step of indent
vim.opt.expandtab=true
vim.opt.autoindent=true --keep indent level on new line

vim.opt.splitright=true
vim.opt.splitbelow=true

vim.opt.title=true
vim.opt.laststatus=2 --to show status bar at bottom of window. change to 3 to have it update for the current/active instance or buffer
vim.opt.cursorline=true -- highlight line where cursor is

-- case insentitive searching unless \C or capital letters included in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.mouse = 'a' --enable mouse support?

-- limit results in lsp list
vim.opt.pumheight = 15
