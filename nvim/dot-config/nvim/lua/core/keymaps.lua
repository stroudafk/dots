
--------------------KEY BINDINGS--------------------
vim.g.mapleader=" "
-- also note to self: command :y A will add to yank stack, then you can use @: to repeat the command for every new line you want to add
-- "ayy to name a register to write to, "Ayy (capital register name) to write to the named register. does the same as above but will overwrite the buffer if you mistype a lowercase 
-- "ap to paste/put

-- "Amended" keybinds are those that overwrite existing behavior
-- "Augmented" keybinds are those that add bindings that did not exist otherwise

--------------------NORMAL MODE--------------------
-- augments
-- center cursor after some vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down, center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up, center cursor" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result, unfold" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, unfold" })

-- better J [[TENTATIVE]]
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines, preserve cursor position" })

-- amendments
-- vim.keymap.set("n", "<leader>t", ":term<CR>", { desc = "Clear search highlights" })

-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle NeoTree"})
vim.keymap.set("n", "<leader>f", function()
  require("fzf-lua").files()
end, { desc = "fzf: Find files" })

-- clear search results highlights upon esc
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- add empty line below and above lines with leader o O
vim.keymap.set("n", "<leader>o", "mzo<Esc>0D`z", { desc = "Add empty space/line below" })
vim.keymap.set("n", "<leader>O", "mzO<Esc>0D`z", { desc = "Add empty space/line above" })

-- move line above/below and match indent
vim.keymap.set("n", "<A-Up>", "<cmd>m-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-Down>", "<cmd>m+<CR>==", { desc = "Move line down" })

-- switch window focus
vim.keymap.set("n", "<M-w>", "<C-w><C-w>", { desc = "Switch focus to another window" })
vim.keymap.set("n", "<M-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<M-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<M-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- resize splits with (meta) alt + <,>,s,f
vim.keymap.set("n", "<M-.>", "<C-w>5>", { desc = "Expand vertical viewport 5 columns" })
vim.keymap.set("n", "<M-,>", "<C-w>5<", { desc = "Shrink vertical viewport 5 columns" })
vim.keymap.set("n", "<M-s>", "<C-w>+", { desc = "Expand viewport" })
vim.keymap.set("n", "<M-f>", "<C-w>-", { desc = "Shrink viewport" })

-- paste from system clipboard
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

-- yank to system clipboard
vim.keymap.set("n", "<leader>yy", '"+y', { desc = "Yank line to system clipboard" })

-- Y to end of line
vim.keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- delete without yanking
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete without yanking" })
vim.keymap.set("n", "<leader>D", '"_d$', { desc = "Delete without yanking" })

-- buffer nav
vim.keymap.set("n", "<leader>bn", ":bn", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bp", { desc = "Previous buffer" })

--------------------INSERT MODE--------------------
-- augments
-- easy Esc on normie boards
vim.keymap.set("i", "jj", "<Esc>")

-- move line above/below and match indent
vim.keymap.set("i", "<A-Up>", "<Esc><cmd>m-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("i", "<A-Down>", "<Esc><cmd>m+<CR>==gi", { desc = "Move line down" })

--------------------VISUAL MODE--------------------
-- augments
-- indent and preserve selection
vim.keymap.set("v", "<", "<gv", { desc = "Indent left, preserve selection" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent left, preserve selection" })

-- amendments
-- move selection up/down
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- yank to system clipboard
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete without yanking" })
