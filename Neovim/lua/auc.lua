-- Auto Commands
local autocmd = vim.api.nvim_create_autocmd

-- New 'FileType' window on 'L' side
autocmd("FileType", {
    pattern = "help",
    callback = function()
        vim.cmd("winc L")
    end
})

autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank { timeout = 1000 }
    end
})

autocmd("BufWritePre", {
    command = ":%s/\\s\\+$//e",
    desc = "Remove trailing whiteapces",
})

autocmd("BufWritePost", {
    command = "normal gg=G``zz"
})

-- autocmd( "BufWritePost", {
--    pattern = vim.env.MYVIMRC,
-- command = "silent source %"
-- })

-- lsp
autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        opts.desc = "LSP Declaration"
        vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, opts)

        opts.desc = "LSP Definition"
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, opts)

        opts.desc = "LSP on Point"
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

        opts.desc = "LSP Implementation"
        vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, opts)

        opts.desc = "LSP Signature Help"
        vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help, opts)

        opts.desc = "LSP Workspace Add"
        vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)

        opts.desc = "LSP Workspace Remove"
        vim.keymap.set('n', '<leader>lwd', vim.lsp.buf.remove_workspace_folder, opts)

        opts.desc = "LSP Workspace List"
        vim.keymap.set('n', '<leader>lwf', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)

        opts.desc = "LSP Type Definition"
        vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, opts)

        opts.desc = "LSP Rename"
        vim.keymap.set('n', '<leader>lR', vim.lsp.buf.rename, opts)

        opts.desc = "LSP Fix"
        vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, opts)

        opts.desc = "LSP Reference"
        vim.keymap.set('n', '<leader>lr', vim.lsp.buf.references, opts)

        opts.desc = "LSP Format"
        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
}
)
