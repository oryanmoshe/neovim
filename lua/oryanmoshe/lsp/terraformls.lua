local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').terraformls.setup({
    capabilities = capabilities,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "terraform",
	command = "setlocal shiftwidth=2 tabstop=2"
})

