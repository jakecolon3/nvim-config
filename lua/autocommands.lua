--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- remap netrw c-l so it doesn't collide with window keybinds
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'netrw' },
  callback = function()
    vim.keymap.del('n', '<C-l>', { buffer = true })
    vim.keymap.set('n', '<C-l>', '<C-w>l', { remap = true, buffer = true })
    vim.keymap.set('n', '<C-M-l>', '<cmd>Ex<CR>', { buffer = true })
  end
})

-- set conceallevel in tex files
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'tex' },
  callback = function()
    vim.o.conceallevel = 2
  end
})
