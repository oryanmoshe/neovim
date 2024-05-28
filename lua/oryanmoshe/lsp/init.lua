require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "gopls", "terraformls", "pylsp", "yamlls", "dockerls", }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').pylsp.setup({
    capabilities = capabilities,
})
require('lspconfig').yamlls.setup({
    capabilities = capabilities,
})
require('lspconfig').dockerls.setup({
    capabilities = capabilities,
})

require('oryanmoshe.lsp.cmp')
require('oryanmoshe.lsp.lua_ls')
require('oryanmoshe.lsp.gopls')
require('oryanmoshe.lsp.terraformls')
