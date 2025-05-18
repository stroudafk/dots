-------------------KEY BINDINGS ----------------
vim.g.mapleader=" "
-- also note to self: command :y A will add to yank stack, then you can use @: to repeat the command for every new line you want to add
-- "ayy to name a register to write to, "Ayy (capital register name) to write to the named register. does the same as above but will overwrite the buffer if you mistype a lowercase 
-- "ap to paste/put
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', {desc = 'Toggle NeoTree'})
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- switch window focus
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
-- remove search highlights with esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- find some way to exit terminal mode easily
