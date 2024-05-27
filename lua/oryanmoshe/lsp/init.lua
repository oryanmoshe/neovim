require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { "lua_ls", "gopls", "terraformls", "pylsp", "yamlls", "dockerls", }
})


require('lspconfig').pylsp.setup({})
require('lspconfig').yamlls.setup({})
require('lspconfig').dockerls.setup({})

require('oryanmoshe.lsp.cmp')
require('oryanmoshe.lsp.lua_ls')
require('oryanmoshe.lsp.gopls')
require('oryanmoshe.lsp.terraformls')
