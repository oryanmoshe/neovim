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
            vim.notify('No changes to format - ' .. formatter .. 'tickdiff: ' .. tickdiff)
        else
            vim.notify('Formatted using ' .. formatter .. 'tickdiff: ' .. tickdiff)
        end
    else
        vim.notify('No changes to format' .. 'tickdiff: ' .. tickdiff)
    end

    vim.b[bufnr].changetick = currtick
end


vim.keymap.set('n', '<leader>=', format, { noremap = true })
