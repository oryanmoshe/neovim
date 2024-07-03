return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require('null-ls')

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.prettierd.with({
                    filetypes = { "javascript", "lua", "python", "typescript", "javascriptreact", "typescriptreact", "html", "tsx", "jsx" }
                }),
                null_ls.builtins.code_actions.gitsigns,
                -- null_ls.builtins.code_actions.refactoring.with({
                --     filetypes = { "go", "javascript", "lua", "python", "typescript", "javascriptreact", "typescriptreact", "html", "tsx", "jsx" }
                -- }),
            }
        })
    end,

}
