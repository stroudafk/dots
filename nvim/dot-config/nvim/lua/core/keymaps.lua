--------------------KEY BINDINGS--------------------
vim.g.mapleader=" "
-- also note to self: command :y A will add to yank stack, then you can use @: to repeat the command for every new line you want to add
-- "ayy to name a register to write to, "Ayy (capital register name) to write to the named register. does the same as above but will overwrite the buffer if you mistype a lowercase 
-- "ap to paste/put

--------------------NORMAL MODE--------------------
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle NeoTree"})
vim.keymap.set("n", "<leader>f", function()
  require("fzf-lua").files()
end, { desc = "fzf: Find files"})

-- clear search results highlights upon esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- add empty line below and above lines with leader o O
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

-- move line above/below and match indent
vim.keymap.set("n", "<A-Up>", "<cmd>m-2<CR>==", { desc = "Move line up"})
vim.keymap.set("n", "<A-Down>", "<cmd>m+<CR>==", { desc = "Move line down"})

-- switch window focus
vim.keymap.set("n", "<M-w>", "<C-w><C-w>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- resize splits with (meta) alt + <,>,s,f
vim.keymap.set("n", "<M-.>", "<C-w>5>", { desc = "Expand vertical viewport 5 columns"})
vim.keymap.set("n", "<M-,>", "<C-w>5<", { desc = "Shrink vertical viewport 5 columns"})
vim.keymap.set("n", "<M-s>", "<C-w>+", { desc = "Expand viewport"})
vim.keymap.set("n", "<M-f>", "<C-w>-", { desc = "Shrink viewport"})

-- center cursor after some vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--------------------INSERT MODE--------------------
-- easy Esc on normie boards
vim.keymap.set("i", "jj", "<Esc>")

-- move line above/below and match indent
vim.keymap.set("i", "<A-Up>", "<Esc><cmd>m-2<CR>==gi", { desc = "Move line up"})
vim.keymap.set("i", "<A-Down>", "<Esc><cmd>m+<CR>==gi", { desc = "Move line down"})

--------------------VISUAL MODE--------------------
