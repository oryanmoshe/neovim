vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Reindent file and return to cursor position
-- vim.keymap.set('n', '<leader>=', 'gg=G``zz')
vim.keymap.set('n', '<leader>/', '<cmd>noh<cr>', { silent = true })

vim.keymap.set('n', '<C-h>', '<C-o>', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-i>', { silent = true })

vim.keymap.set('n', '<localleader>n', '<cmd>bn<cr>', { silent = true })
vim.keymap.set('n', '<localleader>p', '<cmd>bp<cr>', { silent = true })
vim.keymap.set('n', '<localleader>d', '<cmd>bd<cr>', { silent = true })
vim.keymap.set('n', '<localleader>-', '<cmd>b#<cr>', { silent = true })

vim.keymap.set('v', 'K', "<cmd>m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', "<cmd>m '>+1<CR>gv=gv")

vim.keymap.set('n', 'J', "mzJ`z")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set('n', '<localleader>mm', '<cmd>MinimapToggle<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<CR>", [[{-> v:hlsearch ? ":nohl<CR>" : "<CR>"}()]], { silent = true, expr = true })

vim.keymap.set({'n', 'v'}, '<localleader><leader>', vim.lsp.buf.code_action, { noremap = true, silent = true })

vim.keymap.set("n", '<leader>j', function() vim.cmd("wincmd j") end, { noremap = true, silent = true })
vim.keymap.set("n", '<leader>k', function() vim.cmd("wincmd k") end, { noremap = true, silent = true })

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { silent = true })
