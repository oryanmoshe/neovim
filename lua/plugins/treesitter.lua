return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    lazy = false,

    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'go', 'gomod', 'gosum', 'markdown', 'markdown_inline',
                'lua', 'dockerfile', 'json', 'javascript', 'python',
                'gitcommit', 'gitignore', 'git_config', 'git_rebase',
                'toml', 'yaml', 'xml', 'typescript', 'sql', 'fish',
                'bash', 'terraform', 'helm', 'vim', 'vimdoc', 'tsx',
                'proto',
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,

            },

            indent = {
                enable = true
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
        })
    end
}
