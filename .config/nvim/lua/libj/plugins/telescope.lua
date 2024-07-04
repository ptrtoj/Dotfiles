return {
    "nvim-telescope/telescope.nvim", 
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/telescope-fzf-native.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        --require("telescope").setup{
        --    extensions = {
        --        fzf = {
        --            fuzzy = true,
        --            override_generic_sorter = true,
        --            override_file_sorter = true,
        --            case_mode = "smart_case",
        --        }
        --    },

        --}
        --require("telescope").load_extension("fzf")
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>ft", builtin.git_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fr", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end
}
