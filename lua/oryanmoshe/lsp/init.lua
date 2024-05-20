local lsp_zero = require('lsp-zero')
-- local lsp_zero = require('lsp-zero').preset({
--   name = 'minimal',
--   set_lsp_keymaps = true,
--   manage_nvim_cmp = true,
-- })


lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()


cmp.setup({
    sources = {
        { name = "copilot" }, --, group_index = 2 },
        { name = "nvim_lsp" }, --, group_index = 2 },
        { name = "path" }, -- , group_index = 2 },
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
        ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
    }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require('cmp-under-comparator').under_comparator,
            cmp.config.compare.kind,
            cmp.config.compare.length,
            cmp.config.compare.sort_text,
            cmp.config.compare.order,
        },
    },
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- lsp_zero.setup()

-- here you can setup the language servers
require('oryanmoshe.lsp.lua_ls')
require('oryanmoshe.lsp.gopls')
