local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').terraformls.setup({
    capabilities = capabilities,
})
