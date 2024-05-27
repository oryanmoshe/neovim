return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.7',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        ".git",
                        "node_modules"

                    }

                },
                extensions = {
                    file_browser = {
                        hijack_netrw = true
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                }
            })
            require('telescope').load_extension('file_browser')

            local builtin = require('telescope.builtin')
            local tfb = require('telescope').extensions.file_browser

            vim.keymap.set('n', '<localleader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<localleader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<localleader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<localleader>fh', builtin.help_tags, {})
            vim.keymap.set('n', '<localleader>fe', function() tfb.file_browser({ path = '%:p:h' }) end, {})
            -- vim.keymap.set('i', '<A-c>', tfb.actions,{})
            -- vim.keymap.set('n', '<localleader>fe', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", {noremap = true})
        end,
    },
    -- {
    --   "nvim-telescope/telescope-file-browser.nvim",
    --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    -- },
}
