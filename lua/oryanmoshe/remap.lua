vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Reindent file and return to cursor position
vim.keymap.set('n', '<leader>=', 'gg=G``zz')
vim.keymap.set('n', '<leader>/', ':noh<cr>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-o>', {silent = true})
vim.keymap.set('n', '<C-l>', '<C-i>', {silent = true})

vim.keymap.set('n', '<localleader>n', ':bn<cr>', {silent = true})
vim.keymap.set('n', '<localleader>p', ':bp<cr>', {silent = true})
vim.keymap.set('n', '<localleader>d', ':bd<cr>', {silent = true})
