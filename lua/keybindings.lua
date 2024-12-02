vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- When moving up center the cursor on the screen
vim.keymap.set("n", "<c-u>", "<c-u>zz")
-- When moving down center the cursor on the screen
vim.keymap.set("n", "<c-d>", "<c-d>zz")

-- When jumping X lines up, center the cursor on the screen
vim.keymap.set("n", "k", "kzz")
-- When jumping X lines down, center the cursor on the screen
vim.keymap.set("n", "j", "jzz")

-- When searching keep the cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- When jumping to next occurnce of word, center the cursor on the screen 
vim.keymap.set("n", "*", "*zz")

-- Move line up a and move cursor to original position
vim.keymap.set("n", "J", "mzJ`z")
-- Reverse J
vim.keymap.set("n", "<c-j>", "f,wi<enter><esc>")

-- Ensure showing a method name when jumping up to its starting clause
vim.keymap.set("n", "%", "%<Up><Down>")

-- Select entire contents of file
vim.keymap.set("n", "<c-a>", "ggvG$")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Move highligted line(s) up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

-- Replace word in file
vim.keymap.set("n", "<leader>s", ":%s/<C-r><C-w>/<C-r><C-w>/gI<left><left><left>")

-- Delete into void register and then insert 
vim.keymap.set("x", "<leader>p", "\"_dP")
-- Delete into void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Mapping to call LazyGit
vim.keymap.set("n", "<leader>lg", ":LazyGit<enter>")

vim.keymap.set("n", "Q", "<nop>")
-- Reload configuration
vim.keymap.set("n", "<leader>rc", ":so $HOMEPATH/.vimrc<enter>")
