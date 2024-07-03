require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls", "gopls", "terraformls",
        "pylsp", "yamlls", "dockerls", "helm_ls",
        "markdown_oxide", "tsserver", "eslint",
        "css_variables", "html", "tailwindcss",
        "stylelint_lsp",
    }
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').pylsp.setup({
    capabilities = capabilities,
    settings = {
        formatCommand = {"black"}
    },
})
require('lspconfig').yamlls.setup({
    capabilities = capabilities,
})
require('lspconfig').dockerls.setup({
    capabilities = capabilities,
})
require('lspconfig').helm_ls.setup({
    capabilities = capabilities,
})
require('lspconfig').markdown_oxide.setup({
    capabilities = capabilities,
})
require('lspconfig').protols.setup({
    capabilities = capabilities,
})

require('lspconfig').tsserver.setup({
    capabilities = capabilities,
})
require('lspconfig').eslint.setup({
    -- capabilities = capabilities,
})
require('lspconfig').css_variables.setup({
    capabilities = capabilities,
})
require('lspconfig').html.setup({
    capabilities = capabilities,
})
require('lspconfig').tailwindcss.setup({
    capabilities = capabilities,
})
require('lspconfig').stylelint_lsp.setup({
    capabilities = capabilities,
    root_dir = require("lspconfig").util.root_pattern(".prettierrc", "package.json", ".git"),
})


require('oryanmoshe.lsp.cmp')
require('oryanmoshe.lsp.lua_ls')
require('oryanmoshe.lsp.gopls')
require('oryanmoshe.lsp.terraformls')
