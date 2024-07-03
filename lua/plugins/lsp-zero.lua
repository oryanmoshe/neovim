return {
    --- Uncomment the two plugins below if you want to manage the language servers from neovim
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    { 'towolf/vim-helm' },
    { 'neovim/nvim-lspconfig' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'onsails/lspkind-nvim',
            { "mtoohey31/cmp-fish", ft = "fish" },
            'lukas-reineke/cmp-under-comparator',
            'petertriho/cmp-git',
            {
                'Dynge/gitmoji.nvim',
                ft = "gitcommit",
                opts = {}
            }
            -- 'hrsh7th/cmp-emoji',
        },
    },
    -- {'L3MON4D3/LuaSnip'},
}
