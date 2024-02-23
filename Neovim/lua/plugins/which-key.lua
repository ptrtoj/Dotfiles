return {
    "folke/which-key.nvim",
    version="*",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlent = 300
    end,
    opts={},
}


