return {
    "nvim-treesitter/nvim-treesitter",
    "nvim-treesitter/nvim-treesitter-context",
    "nvim-treesitter/nvim-treesitter-textobjects",

    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,

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
