return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",

        -- snippets
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local cmp = require"cmp"

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({select = true}),
            }),
            sources = cmp.config.sources({
                {name = "nvim_lsp"},
                {name = "luasnip"},
            }, {
                {name = "buffer"},
            }, {
                {name = "path"},
            }),
        })

        cmp.setup.cmdline({"/", "?"}, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                {name = "buffer"},
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                {name = "path"},
            }, {
                {name = "cmdline"},
            }),
            matching = {disallow_symbol_nonprefix_matching = false}
        })

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        --require("lspconfig")[clangd].setup({
        --    capabilities = capabilities
        --})
    end,
}
