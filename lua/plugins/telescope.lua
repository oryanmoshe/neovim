return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            'nvim-telescope/telescope-frecency.nvim'
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    file_ignore_patterns = {
                        ".git",
                        "node_modules"

                    },
                    path_display = { "smart" },
                },
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                        prompt_path = true,
                        hidden = {
                            file_browser = true,
                            folder_browser = true
                        },
                    },
                    frecency = {
                        matcher = "fuzzy"
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                }
            })
            require('telescope').load_extension('ui-select')

            local builtin = require('telescope.builtin')

            vim.keymap.set('n', '<localleader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<localleader>fa', function() builtin.find_files({ hidden = true }) end, {})
            vim.keymap.set('n', '<localleader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<localleader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<localleader>fh', builtin.help_tags, {})

            vim.keymap.set('n', '<localleader>fd', builtin.lsp_definitions, {})
            vim.keymap.set('n', '<localleader>fr', builtin.lsp_references, {})
            vim.keymap.set('n', '<localleader>fy', builtin.registers, {})

            require('telescope').load_extension('file_browser')
            local tfb = require('telescope').extensions.file_browser
            vim.keymap.set('n', '<localleader>fe', function() tfb.file_browser({ path = '%:p:h' }) end, {})

            require('telescope').load_extension('frecency')
            local tff = require("telescope").extensions.frecency
            vim.keymap.set('n', '<localleader>/', function() tff.frecency({ workspace = "CWD" }) end, {})

            local opts = { noremap = true, silent = true }

            -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', builtin.lsp_definitions, opts)
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gD', builtin.lsp_implementations, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
            --
            -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
            -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
            -- vim.keymap.set('n', '<space>wl', function()
            --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, opts)
            -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
            -- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
            -- vim.keymap.set('i', '<A-c>', tfb.actions,{})
            -- vim.keymap.set('n', '<localleader>fe', "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>", {noremap = true})
        end,
    },
    -- {
    --   "nvim-telescope/telescope-file-browser.nvim",
    --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    -- },
}
