vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim'
})


-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
--  - ci'  - [C]hange [I]nside [']quote
-- require('mini.ai').setup { n_lines = 500 }

-- Add/delete/replace surroundings (brackets, quotes, etc.)
--
-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
-- - sd'   - [S]urround [D]elete [']quotes
-- - sr)'  - [S]urround [R]eplace [)] [']
require('mini.surround').setup()

require('mini.move').setup {
-- Module mappings. Use `''` (empty string) to disable one.
mappings = {
  -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
  left = 'H',
  right = 'L',
  down = 'J',
  up = 'K',

  -- Move current line in Normal mode
  line_left = 'H',
  line_right = 'L',
  line_down = 'J',
  line_up = 'K',
},

-- Options which control moving behavior
options = {
  -- Automatically reindent selection during linewise vertical move
  reindent_linewise = true,
},
}

require('mini.files').setup({ windows = { preview = true } })

require('mini.align').setup()
-- Simple and easy statusline.
--  You could remove this setup call if you don't like it,
--  and try some other statusline plugin
local statusline = require 'mini.statusline'
-- set use_icons to true if you have a Nerd Font
statusline.setup { use_icons = vim.g.have_nerd_font }

-- You can configure sections in the statusline by overriding their
-- default behavior. For example, here we set the section for
-- cursor location to LINE:COLUMN
---@diagnostic disable-next-line: duplicate-set-field
statusline.section_location = function() return '%2l:%-2v' end

-- ... and there is more!
--  Check out: https://github.com/nvim-mini/mini.nvim
