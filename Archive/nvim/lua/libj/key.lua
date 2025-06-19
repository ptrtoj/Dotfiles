-- Lazy Plugin Manager recommends 
-- "-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct."
-- so I moved there
--vim.g.mapleader = " "

-- Netrw
--vim.keymap.set("n", "<leader>t", vim.cmd.Lex)

-- Move lines upward, downward
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Do join, but cursor stays on original position
--vim.keymap.set("n", "J", "mzJ`z")

-- Do page half up/down, but focus on center
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When search, focus on center
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

-- Paste but preserve yank buffer
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- OS integration of yank buffer
--vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]])

--vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- LSP, diagnostics
--vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

