vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>t", vim.cmd.Lex)

-- Move lines upward, downward
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do join, but cursor stays on original position
vim.keymap.set("n", "J", "mzJ`z")

-- Do page half up/down, but focus on center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When search, focus on center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
