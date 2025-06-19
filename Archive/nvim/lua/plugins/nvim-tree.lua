return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local nvim_tree = require("nvim-tree")
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvim_tree.setup({
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})
		local keymap = vim.keymap
		keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
	end
}
