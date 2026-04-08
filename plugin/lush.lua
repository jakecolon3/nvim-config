vim.pack.add({
    'https://github.com/rktjmp/lush.nvim',
    'file://' .. vim.fn.stdpath('config') .. '/custom/scarlet-forest'
})

vim.cmd.colorscheme 'scarlet-forest'
