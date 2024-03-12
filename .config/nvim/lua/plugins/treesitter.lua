return {
        "nvim-treesitter/nvim-treesitter",
        version="*",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "ada",
                "c", "make", "cmake",
                "haskell",
                "lua",
                "python",
                "html", "css", "javascript",
                "vim", "vimdoc",
                "git_config", "gitignore",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        }
}
