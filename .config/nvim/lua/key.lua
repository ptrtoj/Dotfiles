vim.g.mapleader=" "

-- Lazy Package Manager
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<cr>", { desc = "Package Manager" })

-- Telescope
--vim.keymap.set("n", "<leader>fg", "<cmd>Telescope git_files<cr>")
--vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
--vim.keymap.set("n", "<leader>fo", "<cmd>Telescope find_files<cr>")
--vim.keymap.set("n", "<leader>ft", "<cmd>Telescope grep_string<cr>")

-- Neotree
--vim.keymap.set("n", "<leader>t", "<cmd>Neotree toggle<cr>")

-- Netrw on Left and can toggle
vim.keymap.set("n", "<leader>t", ":Lex<cr>", { desc = "File Explorer" })

-- lsp
vim.keymap.set("n", "<leader>eo", vim.diagnostic.open_float, { desc = "Error - Open Float" })
vim.keymap.set("n", "<leader>e[", vim.diagnostic.goto_prev, { desc = "Error - Prev" })
vim.keymap.set("n", "<leader>e]", vim.diagnostic.goto_next, { desc = "Error - Next" })
vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "Error - List" })

-- may consider below
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- -- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
