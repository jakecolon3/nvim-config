--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
-- also clears luasnip queue
vim.keymap.set('n', '<Esc>', function()
    vim.cmd('nohlsearch')
    while require'luasnip'.get_active_snip() do
        require('luasnip').unlink_current()
    end
end)

-- better c-d/c-u
vim.keymap.set({ 'n', 'v' }, '<C-u>', '<C-u>zz')
vim.keymap.set({ 'n', 'v' }, '<C-d>', '<C-d>zz')

-- better {/}
vim.keymap.set({ 'n', 'v' }, '{', '{zz')
vim.keymap.set({ 'n', 'v' }, '}', '}zz')

-- better indent
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- change tab with alt+h/l
vim.keymap.set({ 'n', 'v' }, '<M-h>', 'gT')
vim.keymap.set({ 'n', 'v' }, '<M-l>', 'gt')

-- # mini.files
-- opens at current buffer directory
-- https://www.reddit.com/r/neovim/comments/1fzfiex/open_minifiles_on_current_directory_focused_on/
local minifiles_toggle = function()
  local MiniFiles = require'mini.files'
  local _ = MiniFiles.close()
    or MiniFiles.open(vim.api.nvim_buf_get_name(0))
  MiniFiles.reveal_cwd()
end


-- open and close
vim.keymap.set('n', '<leader>f', minifiles_toggle, { desc = 'Toggle mini.files' })


-- helper func for the split window with term command
local function check_bufs_name(pattern)
  for index, value in ipairs(vim.api.nvim_list_bufs()) do
    if string.match(vim.api.nvim_buf_get_name(value), pattern) then
      return value
    end
  end
end
-- split window and open terminal
-- toggles window if term buffer already exists
vim.keymap.set('n', '<C-w>t', function()
  local buf = check_bufs_name('^term://')
  -- if current buffer is term
  if string.match(vim.api.nvim_buf_get_name(0), '^term://') then
    -- if current buffer is not the top window
    if vim.api.nvim_win_get_number(0) ~= 1 then
      -- close the window
      vim.api.nvim_win_close(0, false)
    end
  elseif buf then
    -- if there is a term buffer loaded open it
    vim.api.nvim_open_win(buf, true, {split = 'below'})
  else
    -- create new term buffer
    vim.api.nvim_cmd(vim.api.nvim_parse_cmd(':split +term', {}), {})
  end
end
, { desc = 'Open terminal in new window' })

-- # luasnip
-- clear luasnip queue
-- moved to nohlsearch bind

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
