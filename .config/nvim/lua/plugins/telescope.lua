return {
    "nvim-telescope/telescope.nvim", 
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    opts = {
        pickers = {
            find_files = {
                hidden = true,
            },
        },
    },
    config = function()

        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>ft", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fr", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
}
