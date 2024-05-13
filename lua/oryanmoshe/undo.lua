local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

vim.o.undodir =  prefix .. "/nvim/.undo//" 
vim.o.backupdir =  prefix .. "/nvim/.backup//" 
vim.o.directory =  prefix .. "/nvim/.swp//" 

vim.o.undofile = true
