local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').gopls.setup({
    capabilities = capabilities,
    on_attach = function(_, bufnr)
        -- local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     pattern = "*.go",
        --     callback = function()
        --         vim.cmd("%! goimports")
        --         -- require('go.format').goimports()
        --     end,
        --     group = format_sync_grp,
        -- })
        --
        local opts = { buffer = bufnr, noremap = true, silent = true }
        vim.api.nvim_buf_create_user_command(0, "GoImports", ":silent ! goimports -w %", {})
        vim.api.nvim_buf_create_user_command(0, "GoLines", ":silent !golines -w %", {})
        vim.api.nvim_buf_create_user_command(0, "RenameSymbol", function()
            vim.lsp.buf.rename()
            vim.cmd('silent! wa')
        end, {})

        vim.api.nvim_buf_create_user_command(0, 'GoTest', function()
            local file_path = vim.fn.expand('%:p:h')
            local cmd = string.format('go test %s', file_path)
            vim.cmd('!' .. cmd)
        end, {})

        vim.api.nvim_buf_create_user_command(0, 'GoAddTest', function()
            local word = vim.fn.expand('<cword>')
            local file_path = vim.fn.expand('%:p')
            local cmd = string.format('gotests -w -only %s %s', word, file_path)
            vim.cmd('!' .. cmd)
        end, { desc = "Generate test for the function under the cursor using gotests" })

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
        -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
    end
})
