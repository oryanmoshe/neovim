local function format()
    local bufnr = vim.fn.bufnr()
    if vim.b[bufnr].changetick == nil then
        vim.b[bufnr].changetick = vim.api.nvim_buf_get_changedtick(bufnr)
    end
    local formatter = 'vim.lsp.buf.format'

    local client = vim.lsp.get_clients()[1]

    if client and client.supports_method("textDocument/formatting") then
        formatter = client.name
        vim.lsp.buf.format({ async = false })
    else
        formatter = 'gg=G``zz'
        vim.api.nvim_feedkeys('gg=G``zz', 'n', false)
    end

    local currtick = vim.api.nvim_buf_get_changedtick(0)
    local tickdiff = currtick - (vim.b[bufnr].changetick or currtick)

    if tickdiff > 0 then
        if client.name == 'lua_ls' and (currtick - vim.b[bufnr].changetick) <= 2 then
            -- vim.api.nvim_feedkeys('u', 'n', false)
            -- vim.notify('No changes to format - ' .. formatter .. ' | tickdiff: ' .. tickdiff, vim.log.levels.OFF)
        else
            -- vim.notify('Formatted using ' .. formatter .. ' | tickdiff: ' .. tickdiff, vim.log.levels.OFF)
        end
    else
        -- vim.notify('No changes to format | tickdiff: ' .. tickdiff, vim.log.levels.OFF)
    end

    vim.b[bufnr].changetick = currtick
end


vim.keymap.set('n', '<leader>=', format, { noremap = true })

-- vim.api.nvim_create_user_command("Prettier", ':silent !prettier --cache --write --config ./web/.prettierrc "%"', {})

vim.api.nvim_create_autocmd({"BufEnter", "FileType"}, {
    pattern = { "*.tsx", "*.ts", "*.js", "*.jsx", "*.proto" },
    callback = function(ev)
        -- vim.api.nvim_create_user_command("Prettier", ':silent !printf "$(cat \'%\' | prettierd \'%\')" > "%"', {})
        -- vim.keymap.set('n', '<leader>=', '<cmd>Prettier<CR>', { noremap = true, silent = true })
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
    end
})

vim.api.nvim_create_autocmd({"BufEnter", "FileType"}, {
    pattern = {"*.go", "go"},
    callback = function(ev)
        -- vim.api.nvim_create_user_command("Prettier", ':silent !printf "$(cat \'%\' | prettierd \'%\')" > "%"', {})
        -- vim.keymap.set('n', '<leader>=', '<cmd>Prettier<CR>', { noremap = true, silent = true })
        vim.opt_local.expandtab = false
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end
})
--

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = { "*.go" },
    callback = function()
        vim.cmd("GoImports")
        -- vim.lsp.buf.format({ async = false })
        -- vim.cmd("Prettier")
        -- require('go.format').goimports()
    end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*.tsx", "*.ts", "*.js", "*.jsx" },
    callback = function()
        format()
        -- vim.lsp.buf.format({ async = false })
        -- vim.cmd("Prettier")
        -- require('go.format').goimports()
    end,
})
vim.api.nvim_create_user_command("RenameSymbol", function()
    vim.lsp.buf.rename()
    vim.cmd('silent! wa')
end, {})
