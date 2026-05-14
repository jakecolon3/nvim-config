--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  desc = 'Enter terminal mode when a new terminal buffer is created',
  pattern = { '*' },
  group = vim.api.nvim_create_augroup('termwindow', { clear = false} ),
  command = 'startinsert',
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  desc = 'Enter terminal mode when a terminal buffer is focused',
  pattern = { 'term://*' },
  group = vim.api.nvim_create_augroup('termwindow', { clear = false} ),
  command = 'startinsert',

})
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  desc = 'Set makeprg to "./run.sh" if it exists in cwd',
  group = vim.api.nvim_create_augroup('jake', { clear = false} ),
  callback = function()
    if vim.uv.fs_stat('./run.sh') then
      vim.cmd('set makeprg=./run.sh')
    end
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Set conceallevel in tex files',
  pattern = { 'tex' },
  group = 'filetypeplugin',
  callback = function()
    vim.o.conceallevel = 2
  end,
})

-- godot language server
vim.api.nvim_create_autocmd({ 'FileType' }, {
  desc = 'Godot language server setup',
  pattern = { 'gd' },
  group = 'filetypeplugin',
  callback = function()
    -- https://simondalvai.org/blog/godot-neovim/
    -- paths to check for project.godot file
    local paths_to_check = {'/', '/../'}
    local is_godot_project = false
    local cwd = vim.fn.getcwd()

    -- iterate over paths and check
    for key, value in pairs(paths_to_check) do
        if vim.uv.fs_stat(cwd .. value .. 'project.godot') then
            is_godot_project = true
            break
        end
    end

    -- check if server is already running in godot project path
    local is_server_running = vim.uv.fs_stat('/tmp/nvim-godot.pipe')
    -- start server, if not already running
    if is_godot_project and not is_server_running then
        vim.fn.serverstart('/tmp/nvim-godot.pipe')
    end

    vim.lsp.config('gdscript', {})
    vim.lsp.enable('gdscript')
  end
})
