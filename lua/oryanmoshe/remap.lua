vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Reindent file and return to cursor position
vim.keymap.set('n', '<leader>=', 'gg=G``')
vim.keymap.set('n', '<leader>/', ':noh<cr>', { silent = true })
