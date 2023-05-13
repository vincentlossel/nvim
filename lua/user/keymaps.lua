vim.g.mapleader = " "

-- Amazing, wow
vim.keymap.set("n", "x", "_x")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<Leader>w", "<Cmd>w<CR>")

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
vim.keymap.set("n", "dw", "vbdj k sk")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Tabs
vim.keymap.set("n", "tn", ":tabnew<CR>")
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "tc", ":tabclose<CR>")

vim.keymap.set("n", "gt", ":tabnext<Return>")
vim.keymap.set("n", "gr", ":tabprevious<Return>")

-- Windows
vim.keymap.set("n", "<Leader>ss", ":split<Return><C-w>w")
vim.keymap.set("n", "<Leader>sv", ":vsplit<Return><C-w>w")

vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- Explorer
vim.keymap.set("n", "<Leader>pv", ":Ex<Return>")
