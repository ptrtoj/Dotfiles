return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
    config = function()
        require("nvim-autopairs").setup({
            -- disable close parenthesis, if there's already one
            enable_check_bracket_line = false,
            -- will ignore alphanumeric and `.` symbol
            ignored_next_char = "[%w%.]"

        })

        -- nvim-cmp integration
        -- add opening parenthesis, after select function name
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp = require("cmp")
        cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
        )
    end,
}
