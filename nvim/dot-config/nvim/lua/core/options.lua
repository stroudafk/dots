--------------------OPTIONS--------------------

vim.o.number=true
vim.o.relativenumber=true
vim.o.syntax="on"
vim.o.showmatch=true --highlight matching brackets
vim.o.showmode = false
-- Show live replace changes in split buffer
vim.opt.inccommand = "split"

-- fix lsp not recognizing library = vim.api.nvim_get_runtime_file("", true),
-- vim.diagnostic.config({
--   virtual_text = {
--     source = "always",
--   },
-- })

vim.o.termguicolors=true

-- indent settings
vim.o.tabstop=2 --number of spaces a tab counts for and maybe shows as?
vim.o.shiftwidth=0 -- num of spaces to use for each step of indent
vim.o.expandtab=true
vim.o.autoindent=true --keep indent level on new line
vim.o.cindent=true -- indent based on language. should always have auto indent when this is on

vim.opt.splitright=true
vim.opt.splitbelow=true

vim.opt.title=true
vim.opt.laststatus=2 --to show status bar at bottom of window. change to 3 to have it update for the current/active instance or buffer
vim.opt.cursorline=true -- highlight line where cursor is

-- cursor appearance
-- vim.opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/1Cursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- case insentitive searching unless \C or capital letters included in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.mouse = 'a' --enable mouse support?

-- limit results in lsp list
vim.o.pumheight = 15

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("UserConfig", {}),
  callback = function ()
    vim.highlight.on_yank()
  end,
})
